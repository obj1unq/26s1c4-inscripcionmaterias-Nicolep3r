class Estudiante {
	const materiasAprobadas = []


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

}



	class MateriaAprobada{
		const materia
		var nota

		method materia() = materia
		method nota() = nota

	}


	class Materia{
		const nombreMateria

		method nombreMateria() = nombreMateria
	}