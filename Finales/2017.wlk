class Compra {

    const property juguetes 

    method totalAPagar() = juguetes.map({j => j.precio()}).sum()

}

class Juguete {

    const property origen 

    const property edad

    

    method precioBase()

    method precio()= self.precioBase() * origen.recargo() * edad.adicional()

}



class Peluche inherits Juguete {

    const property tamanio = 25

    override method precioBase() = tamanio * 10

}

class Didactico inherits Juguete {

    const property precioBase = 200

}



object primeraInfancia {

    const property adicional = 1.1

}



object chico{

    var property publicidad = true 

    method adicional() = if (publicidad) 1.30 else 1

}

object china {

    const property recargo = 1.1

}

object usa {

    const property recargo = 1.5

}




// compra.totalAPagar()

const juego = new Didactico( origen = china, edad = primeraInfancia)

const juego2 = new Didactico( origen = usa, edad = primeraInfancia)

const oso = new Peluche( origen = china, edad = chico)

const osito = new Peluche( origen = usa, edad = chico)

const compra = new Compra( juguetes = [juego, juego2, oso, osito])