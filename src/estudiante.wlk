import materia.*
import materiasAprobadas.*
import requisitos.*


/*Crear el objeto requisito y */
class Estudiante {
	const carrerasInscriptas = #{}
	const materiasAprobadas = #{}
	const materiasInscriptas = #{}

	method materiasInscriptas() = materiasInscriptas

	method aprobar(materia, nota) {
	if(requisitoAproboMateria.cumpleRequisito(self, materia)){
		self.error("Ya se registro la aprobacion de esta materia")
	}
	materiasAprobadas.add(new MateriaAprobada(materia = materia,
												 nota = nota))
  	}

	// method aprobo(materia) {
    //     return materiasAprobadas.any ({mataprob => mataprob.materia() == materia })
    // }
	//Se lo delegue a requisitos, no se que tan bien este. Me gustaria respuesta a esta pregunta :) 

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
	  	self.inscribirseMateriaSegunCupo(materia)
		
	}

	method darDeBaja(materia) {
	  	materia.darDeBajaAlumno(self)
	}
	
	method inscribirseMateriaSegunCupo(materia) {
	  if(materia.hayCupo()){
		materiasInscriptas.add(materia)
		materia.inscribirAlumno(self)
	  }else{
	  	materia.agregarEnListaDeEspera(self)
	  }
	}


	method puedeInscribirse(materia) {
	  return requisitoCorrespondeACarreraCursando.cumpleRequisito(self, materia) &&
	  		not requisitoAproboMateria.cumpleRequisito(self, materia) &&
			not requisitoYaEstaInscripto.cumpleRequisito(self, materia) &&
			materia.requisito().cumpleRequisito(self, materia)
	}

	// method materiaCorrespondeACarreraCursando(materia){
	// 	return self.materiaDeTodasLasCarrerasInscriptas().contains(materia)
	// }

	// method estaInscripto(materia){
	//   return materiasInscriptas.contains(materia)
	// }
	//Se lo delegue a requisitos, no se que tan bien este. Me gustaria respuesta a esta pregunta :) 
	method cumpleCorrelativas(materia){
	  return materia.materiasRequeridas().all({correlativa => requisitoAproboMateria.cumpleRequisito(self, materia)})
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

	method cantCreditosTotales() {
	  return materiasAprobadas.sum({materiaAprobada => materiaAprobada.materia().cantCreditosQueOtorga()})
	}

	method cantMateriasAprobadasDeCarrera(carreraAv) {
	   return materiasAprobadas.count({materiaAp => materiaAp.materia().carrera() == carreraAv})	
	}
}



	class Carrera{
		const property materias = #{}
	}