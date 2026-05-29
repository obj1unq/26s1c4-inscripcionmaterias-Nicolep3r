import materia.*
import materiasAprobadas.*

class Estudiante {
	const carrerasInscriptas = #{}
	const materiasAprobadas = []
	const materiasInscriptas = #{}

	method materiasInscriptas() = materiasInscriptas


	method aprobar(materia, nota) {
	if(self.aprobo(materia)){
		self.error("Ya se registro la aprobacion de esta materia")
	}
	materiasAprobadas.add(new MateriaAprobada(materia = materia,
												 nota = nota))
  	}

	method aprobo(materia) {
		return materiasAprobadas.any({materiaAprobada => materiaAprobada.materia() == materia})
	}

	method promedioNotasAprobadas() {
	  return materiasAprobadas.average({materia => materia.nota()})
	}

	method materiaDeTodasLasCarrerasInscriptas() {

	  	return carrerasInscriptas.map({ carrera => carrera.materias() }).flatten().asSet()
	}

	method inscribirseAMateria(materia) {
		if(!self.puedeInscribirse(materia)){
			self.error("No cumple los requisitos para la inscripcion")
		}
	  	materiasInscriptas.add(materia)
	}


	method puedeInscribirse(materia) {
	  return self.materiaCorrespondeACarreraCursando(materia) && !self.aprobo(materia) && self.estaInscripto(materia) && self.cumpleCorrelativas(materia)
	}

	method materiaCorrespondeACarreraCursando(materia){
		return self.materiaDeTodasLasCarrerasInscriptas().contains(materia)
	}

	method estaInscripto(materia){
	  return materiasInscriptas.contains(materia)
	}

	method cumpleCorrelativas(materia){
	  return materia.materiasRequeridas().all({correlativa => materiasAprobadas.contains(correlativa)})
	}

	method inscribirseMateria(materia) {
	  if(materia.hayCupo()){
		materiasInscriptas.add(materia)
	  }
	  materia.agregarListaDeEspera(self)
	}

	method materiasEnListaDeEspera() {
    	return self.materiaDeTodasLasCarrerasInscriptas().filter({ materia => materia.listaDeEspera().contains(self) })
	}

	method materiasHabilitadasDeCarrera(carrera) {
   	 	if(!carrerasInscriptas.contains(carrera)) {
			self.error("No esta inscripto en esta carrera")
    	}
			return carrera.materias().filter({ materia => self.puedeInscribirse(materia) })

}

}



	class Carrera{
		const property materias = #{}
	}