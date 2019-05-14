import cosas.*

object camion {
	const property cosas = []
	 var property peso = 1000
	 var pesoMaximo = 2500
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambios()
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method pesoTotal()= peso + cosas.sum{cosa => cosa.peso()}
	method excedidoDePeso()= self.pesoTotal() > pesoMaximo
	method objectosPeligrosos(nivel)= cosas.filter{cosa => cosa.nivelDePeligrosidad() > nivel}
	method objectosMasPeligrososQue(cosa)=
	 cosas.filter{cosaL => cosaL.nivelDePeligrosidad() > cosa.nivelDePeligrosidad()}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad)= cosas.all{cosa => cosa.nivelDePeligrosidad() < nivelMaximoPeligrosidad }	
	method tieneAlgoQuePesaEntre(min,max) = cosas.any{cosa => min < cosa.peso() and cosa.peso()< max }
	method cosaMasPesada()= cosas.max{cosa => cosa.peso()}
	method totalBultos() = cosas.sum{cosa => cosa.bulto()}
	method pesos()= cosas.map{cosa => cosa.peso() }
	
}

//Se pide agregar estos mensajes al camión:
//* `tieneAlgoQuePesaEntre(min, max)`: indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo;
//* `cosaMasPesada()`: la cosa más pesada que tenga el camión. Ojo que lo que se pide es _la cosa_ y no su peso.
//* `totalBultos()`: la suma de la cantidad de bultos que está transportando. KnightRider, arena a granel y residuos radioactivos son 1 bulto.
// Bumblebee y embalaje de seguridad son dos. Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más. 
// Batería antiaérea: 1 si no tiene misiles, 2 si tiene. Contenedor portuario: 1 + los bultos que tiene adentro.
//* `pesos()`: devuelve una lista con _los pesos_ de cada cosa que tiene el camión.
//Agregar la posibilidad de que al cargar una cosa en el camión, esta pueda sufrir cambios.
// Estos cambios tienen que ocurrir automáticamente cuando, por ejemplo, se ejecuta `camion.cargar(arenaGranel)`.

