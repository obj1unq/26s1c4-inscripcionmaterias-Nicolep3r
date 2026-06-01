object listaPorOrdenDeLlegada {
  method inscribirEnListaDeEspera(materia, alumno) {
    materia.listaDeEspera().add(alumno)
  }
}

object listaElitista{
    method inscribirEnListaDeEspera(materia, alumno) {
        materia.listaDeEspera().add(alumno)
        self.listaOrdenada(materia)
  }

    method listaOrdenada(materia) {
      materia.listaDeEspera().sortBy({alumno1, alumno2 => alumno1.promedioNotasAprobadas() > alumno2.promedioNotasAprobadas()})
    }
}

object listaPorGradoDeAvance {
    method inscribirEnListaDeEspera(materia, alumno) {
        materia.listaDeEspera().add(alumno)
        self.listaOrdenada(materia)
    }

    method listaOrdenada(materia) {
      materia.listaDeEspera().sortBy({alumno1, alumno2 => alumno1.cantMateriasAprobadasDeCarrera(materia.carrera()) >
                                                         alumno2.cantMateriasAprobadasDeCarrera(materia.carrera())
                                    })
    }

}