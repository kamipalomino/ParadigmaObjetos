class Empleados {
    // var property habilidades = [ ]
        var property salud = 100
        var property puesto 
    
   // method saludCritica() = puesto.saludCritica()
    
    method estoyIncapacitado() = salud < puesto.saludCritica()
    
    method recibirDanio(mision) = salud -= mision.peligrosidad()
    
    method sobreviviAlaMision() = salud > 0
    
    method puedoUsarHabilidad(habilidad) = (!self.estoyIncapacitado()) && (puesto.habilidades().contains(habilidad))
    
    method recompensaDeMision(mision) = puesto.recompensaDeMision(mision)
}

object espia {
    var property habilidades = ["disparar", "correr"]
    method saludCritica() = 15
    method recompensaDeMision(mision) = if(mision.completada(self)) habilidades.add(mision.habilidadesRequeridas())
}

object oficinista {
    var property habilidades = ["nadar"]
    var property estrella = 0
    //var property puesto = self
    var property salud = 100
    
    method estrella(suma) = estrella += suma 
    method saludCritica() = 40 - 5 * estrella 
    method recompensaDeMision(mision) = if(mision.completada(self)) self.estrella(1) else self.estrella()
}

// method cambiarPuesto() = if (self.estrella() >= 3) self.puesto(new Empleado(puesto = espia())) else self.puesto()

class Mision {
  var property habilidadesRequeridas = ["nadar", "correr"]
  var property peligrosidad = 30
  
  method completada(empleado) = true
  
  method tienenHabilidades(empleados) =
        self.habilidadesRequeridas().forEach({hab => empleados.puedoUsarHabilidad(hab)})
}
