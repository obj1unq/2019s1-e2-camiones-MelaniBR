
object knightRider {
	
	method peso() { return 500 }
	method nivelDePeligrosidad() { return 10 }
	method bulto() = 1
	method cambios(){}
}
object bumblebee {
	var property transformadoEnAuto = true
	
	method peso() { return 800 } 
	method nivelDePeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto()= 2
	method cambios(){self.transformar()}
	
}
object paqueteDeLadrillos{
	var property cantLadrillos
	
	method peso() = cantLadrillos * 2 
	method nivelDePeligrosidad() = 2
	method bulto() = self.bultoSuma(0,100,1)+ self.bultoSuma(100,301,2) + self.bultoSuma(300,1000,3) 
	method bultoSuma(nroMenor,nroMayor ,resultado) = if (cantLadrillos > nroMenor and cantLadrillos < nroMayor) resultado
	 											else 0				 
	
	method cambios(){cantLadrillos =+ 12}
	 
}
object arenaGranel {
	 var property peso = null 
	 method nivelDePeligrosidad()= 1 
	 method bulto()= 1
     method cambios(){peso =+ 20} 
}
object bateriaAntiaerea{
	var property misiles = false
	method peso()= if (misiles) 300 else 200
	method nivelDePeligrosidad() = if (misiles) 100 else 0
	method bulto() = if (misiles ) 1 else 2
	method cambios(){self.misiles(true)}
}
object contenedorPortuario{
	
	var property cosas = []
	var  peso = 100 
	method peso() = if (not (cosas == []))
	 peso + cosas.sum{cosa => cosa.peso()} else peso
	
	
	method nivelDePeligrosidad() = if (not(cosas == []))
	cosas.max{unaCosa => unaCosa.nivelDePeligrosidad()}.nivelDePeligrosidad() 
				else 0
	method bulto() = 1 + cosas.forEach{cosa => cosa.bulto()}
	method cambios()= cosas.forEach{cosa=> cosa.cambios()}
	method agregar (cosa)= cosas.add(cosa)
	method descargar (cosa) = cosas.remove(cosa)
	}    
object residuosRadioactivos {
		var property peso 
		method nivelDePeligrosidad() = 200
		method bulto () =1
		method cambios() { peso =+ 15}
 }
object embalajeDeSeguridad {
          var property peso
          var nivelDePeligrosidad
          method embalar(cosa){
				peso = cosa.peso()
				nivelDePeligrosidad = cosa.nivelDePeligrosidad()
	}
          
        method nivelDePeligrosidad() = nivelDePeligrosidad / 2 	
		  method bulto()=2
		  method cambios(){}
}

