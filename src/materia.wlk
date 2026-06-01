    import estudiante.*
	class Materia{
		const property carrera
		const nombreMateria
		const property materiasRequeridas = #{}
		const property cantCupo
		var cantInscriptos = 0
		const listaDeEspera = []
		const property alumnosInscriptos = #{}
		var property cantCreditosQueOtorga = 0
		const property anioCarrera
		const property requisito //Objeto requisito
		const property estrategiaListaDeEspera  //Objeto lista de espera

		method listaDeEspera() = listaDeEspera
		method nombreMateria() = nombreMateria



		method inscribirAlumno(alumno){
			alumnosInscriptos.add(alumno)
			cantInscriptos += 1
		}

		method hayCupo() {
		  return cantCupo > cantInscriptos
		}


		method agregarEnListaDeEspera(alumno) {
			estrategiaListaDeEspera.inscribirEnListaDeEspera(self, alumno) 
			
			// listaDeEspera.add(alumno) //	ESTRATEGIA
		}

		method darDeBajaAlumno(alumno) {
		  alumnosInscriptos.remove(alumno)
		  cantInscriptos -= 1

		  self.otorgarCupoAAlumno()
		}

		method otorgarCupoAAlumno() {
		  if(!listaDeEspera.isEmpty()){
			const alumno = self.primerAlumnoEnListaDeEspera()

			self.inscribirAlumno(alumno)
			listaDeEspera.remove(alumno)

			// self.aumentarInscriptos()
		  }
		}

		method primerAlumnoEnListaDeEspera() {
		  return listaDeEspera.first()
		}
	}