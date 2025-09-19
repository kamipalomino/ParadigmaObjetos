class Empleados{

        var property misiones = #{ }
        var property salud = 100
        
        var property puesto 
    

    method estoyIncapacitado() = salud < puesto.saludCritica()

    method recibirDanio(peligrosidad) { salud -= peligrosidad}    

    method sobreviviAlaMision() = salud > 0   

    method puedoUsarHabilidad(habilidad) = (!self.estoyIncapacitado()) && (puesto.habilidades().contains(habilidad))    

    method recompensaDeMision(habil) = puesto.recompensaDeMision(habil)

    
    method registrar(mision) = self.misiones().add(mision)
    
    method completarMision(mision, hab){
        if(mision.completada(self) && self.sobreviviAlaMision()){
            self.recompensaDeMision(hab)
            self.registrar(mision) 
        }
        return misiones 
    }
    method cambiarPuesto(unPuesto) {
      if (puesto.puedoCambiar()) { self.puesto(unPuesto) }
      throw new Exception(message = "No sé puede cambiar de puesto por ahora ")
      
    }
    
}



object espia {

    var property habilidades = ["disparar", "correr"]
    const property puedoCambiar = false 
    
    method saludCritica() = 15

    method recompensaDeMision(habil) = habilidades.add(habil)
}



object oficinista {

    var property habilidades = ["nadar"]

    var property estrella = 0

    var property salud = 100

    method puedoCambiar() = self.estrella() >= 3

    method estrellas(suma) {estrella += suma }

    method saludCritica() = 40 - 5 * estrella 

    method recompensaDeMision(habil) = self.estrellas(1)
}


class Jefe inherits Empleados() {
    var property subordinados
    
    override method puedoUsarHabilidad(habilidad) = self.subordinadoUsaHabilidad(habilidad) || super(habilidad)
    
    method subordinadoUsaHabilidad(habilidad) = self.subordinados().any({empleado => empleado.puedoUsarHabilidad(habilidad)})
    
    override method recibirDanio(peligrosidad){
        const danio = peligrosidad / 3
        self.subordinados().forEach{e => e.recibirDanio(danio)}
    }
}

class Mision {

  var property habilidadesRequeridas = ["nadar", "correr"]
  var property peligrosidad = 30

  method completada(empleados) {
     empleados.recibirDanio(peligrosidad)
     return self.tienenHabilidades(empleados)
  }

  method tienenHabilidades(empleados) {

       self.habilidadesRequeridas().all({hab => empleados.puedoUsarHabilidad(hab)})
  } 
}



const uno = new Empleados(puesto = espia)
const dos = new Empleados(puesto = oficinista)
const primer = new Mision(habilidadesRequeridas = ["correr"])
const segunda = new Mision()
const jefe = new Jefe(subordinados = #{uno, dos}, puesto = espia)

// jefe.subordinados().forEach{e => e.salud()}
// uno.completarMision(primer, "nadar")
//dos.completarMision(segunda, "")
//dos.puesto().habilidades().add("correr")