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

//Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
object paqueteDeLadrillos {
	var ladrillos = 0
	method peso(){return ladrillos*2}
	method nivelPeligrosidad(){return 2}
	method cantidadLadrillos(cantidad){ladrillos = cantidad}	
}
  
//Arena a granel: el peso es variable, la peligrosidad es 1.
object arenaAGranel {
	var peso = 0
	method peso(){return peso}
	method nivelPeligrosidad(){return 1}
	method agregarPeso(kg){return peso += kg}
}
 
//Batería antiaérea : el peso es 300 kilos si está con los misiles o 200 en otro caso. 
//En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
object bateriaAGranel {
	var misiles = false
	method peso(){return if (misiles) {300} else {200}}
	method nivelPeligrosidad(){return if (misiles) 100 else {0}}
	method ponerMisiles(){misiles = true}
}

//Contenedor portuario: un contenedor puede tener otras cosas adentro. 
//El peso es 100 + la suma de todas las cosas que estén adentro. Es tan peligroso como el objeto más peligroso que contiene. 
//Si está vacío, su peligrosidad es 0.
object contenedorPortuario {
	var cosas = []
	method peso(){return cosas.sum({cosa => cosa.peso()}) + 100}
	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}
		else return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}
	method aniadirObjetos(objeto){cosas.add(objeto)}
}

//Residuos radioactivos: el peso es variable y su peligrosidad es 200.
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