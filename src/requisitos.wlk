//Requisitos para materia
object requisitoCredito {
    const creditosNecesarios = 250

	method cumpleRequisito(alumno, materia) { 
		return alumno.cantCreditosTotales() >= creditosNecesarios
	}
}
object requisitoPorAño{

    method cumpleRequisito(alumno, materia) { 
        
		return self.materiasDeAnioAnterior(materia).all({unaMateria => alumno.aprobo(unaMateria)})
	}

    method materiasDeAnioAnterior(materia) {
        const anioAnteriorDeMateria = materia.anioCarrera()-1 //anio anterior de la materia que quiero ver

        return materia.carrera().materias().filter({unaMateria => unaMateria.anioCarrera() == anioAnteriorDeMateria})//Devuelve una coleccion de materias
    }


}
object requisitoNinguno{
     method cumpleRequisito(alumno, materia) { 
        return true
	}
}

//Requisitos para alumno 

object requisitoCorrespondeACarreraCursando{
    method cumpleRequisito(alumno, materia) {
      return alumno.materiaDeTodasLasCarrerasInscriptas().contains(materia)
    }
}
object requisitoAproboMateria {
  method cumpleRequisito(alumno, materia) {
      return alumno.materiasAprobadas().any ({mataprob => mataprob.materia() == materia })
    }
}

object requisitoYaEstaInscripto {

  method cumpleRequisito(alumno, materia) {
      return alumno.materiasInscriptas().contains(materia)
    }
}
