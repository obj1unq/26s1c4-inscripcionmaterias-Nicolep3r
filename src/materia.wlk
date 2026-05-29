    import estudiante.*
	class Materia{
		const nombreMateria
		const property materiasRequeridas = #{}
		const property cantCupo
		var cantInscriptos = alumnosInscriptos.size()
		const listaDeEspera = []
		const property alumnosInscriptos = #{}


		method listaDeEspera() = listaDeEspera
		method nombreMateria() = nombreMateria



		method hayCupo() {
		  return cantCupo > cantInscriptos
		}

		method aumentarInscriptos() {
			cantInscriptos += 1
		}

		method agregarEnListaDeEspera(alumno) {
			listaDeEspera.add(alumno)
		}

		method darDeBaja(alumno) {
		  alumnosInscriptos.remove(alumno)
		  cantInscriptos -= 1

		  self.otorgarCupoAAlumno()
		}

		method otorgarCupoAAlumno() {
		  if(!listaDeEspera.isEmpty()){
			const alumno = self.primerAlumnoEnListaDeEspera()

			alumnosInscriptos.add(alumno)
			listaDeEspera.remove(alumno)

			self.aumentarInscriptos()
		  }
		}

		method primerAlumnoEnListaDeEspera() {
		  return listaDeEspera.first()
		}
	}