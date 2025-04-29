object neo {
    var energia = 100

    method esElElegido() = true
    method saltar() {energia = energia / 2} // nunca va a ser menor que 0
    method vitalidad() = energia * 0.1 // no es atributo xq siempre es la décima parte de su energia

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false
    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado
        } // controlo que vitalidad no sea menor que 0
    method vitalidad() = vitalidad // por polimorfismo UNICAMENTE SI LO NECESITO. SUPER IMPORTANTE!!!!

}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {} // un método de indicación con bloque de código {} que no hace nada.

}

object nave {
    const pasajeros = [neo,morfeo] // referencia const porque siempre va a apuntar a esa lista. La referencia es constante, la lista sigue siendo mutable.
    method cantidadPasajeros() = pasajeros.size() // pasajero es una referencia a una lista x eso le puedo pasar mensajes de listas.
    method pasajeroDeMayorVitalidad() =
        pasajeros.max({pax => pax.vitalidad()})  
        // uso el igual cuando tengo una expresión. Si tengo más de una debo usar la llave con el return para que funcione.
        // transformo sus elementos para poder compararlos.
        // La variable pax sirve para ir "recorriendo" todos los elementos de la lista
    method estaEquilibrada() = self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenosVitalidad().vitalidad() * 2
    method pasajeroDeMenosVitalidad() = pasajeros.min({pax => pax.vitalidad()})
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    } //forEach no cambia la lista. Cambia los elementos que están dentro de la lista.
    method acelerar() {
        // filtro la lista
        self.pasajerosNoSonElElegido().forEach({p=>p.saltar()})
    }
    method pasajerosNoSonElElegido() = pasajeros.filter({p=>!p.esElElegido()})

}   

// coleccion nave va a contener otra coleccion (neo, morfeo y trinity)