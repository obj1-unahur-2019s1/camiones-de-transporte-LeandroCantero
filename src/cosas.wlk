object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

//Paquete de ladrillos:
object paqueteDeLadrillos {
	var ladrillos = 0
	method peso(){return ladrillos*2}
	method nivelPeligrosidad(){return 2}
	method cantidadLadrillos(cantidad){ladrillos = cantidad}	
}
  
//Arena a granel:
object arenaAGranel {
	var peso = 0
	method peso(){return peso}
	method nivelPeligrosidad(){return 1}
	method agregarPeso(kg){return peso += kg}
}
 
//Batería antiaérea:
object bateriaAGranel {
	var misiles = false
	method peso(){return if (misiles) {300} else {200}}
	method nivelPeligrosidad(){return if (misiles) 100 else {0}}
	method ponerMisiles(){misiles = true}
}

//Contenedor portuario:
object contenedorPortuario {
	var cosas = []
	method peso(){return cosas.sum({cosa => cosa.peso()}) + 100}
	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}
		else return cosas.max({cosa => cosa.nivelPeligrosidad()})//arreglar
	}
	method aniadirObjetos(objeto){cosas.add(objeto)}
}

//Residuos radioactivos:
object residuosRadioactivos {
	var peso = 0
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
	method sumarPeso(kg){peso += kg}
}
 
//Embalaje de seguridad:
object embalajeDeSeguridad {
	var cosa
	method envolverCosa(objeto){cosa = objeto}
	method peso(){return cosa.peso()}
	method nivelPeligrosidad(){return cosa.nivelPeligrosidad()/2}
}