class Parque {
    const property visitantes = [ ]
    var property saldo = 0
    
    method cobrarEntrada(){
        if(!visitantes.isEmpty()) { visitantes.forEach {v => self.cobrarleA(v)}}
        throw new Exception(message = "no hay visitantes")
    }
    method cobrarleA(visitante){
        visitante.pagarEntrada()
        saldo += visitante.tarifa()
        }
}

class Visitante{
    var property formaDePago
    method tarifa() 
    method pagarEntrada() { formaDePago.pagarEntrada(self.tarifa())}
}
class Ninio inherits Visitante{
    override method tarifa()=50
}
class Adulto inherits Visitante{
    override method tarifa()=100
}

object paseRapido {
    var property access = 100
    method pagarEntrada(tarifa){
        if(access > 0) access -= 1
        throw new Exception(message = "no hay mas accesos")
    }
}
object prepago {
    var property saldo = 1000
    
    method pagarEntrada(tarifa){
        const pago = 1.1 * tarifa
        if(saldo > pago) saldo -= pago 
        throw new Exception(message = "no queda saldo")
    }
}
object efectivo {
    method pagarEntrada(tarifa){ }
}


const uno = new Ninio(formaDePago = paseRapido)
const dos = new Ninio(formaDePago = prepago)
const tres = new Adulto(formaDePago = efectivo)
const park = new Parque()
const otro = new Parque( visitantes = [uno, dos, tres])
//  dos.formaDePago().access(0)
//  tres.formaDePago(prepago)
