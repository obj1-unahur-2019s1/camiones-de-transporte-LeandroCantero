import cosas.*

class Camion {
	const property cosas = []
	const tara = 1000
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal(){
		return cosas.sum({cosa => cosa.peso()}) + tara
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	
	method objetosPeligrosos(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(objeto){
		return self.objetosPeligrosos(objeto.nivelPeligrosidad())
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.objetosPeligrosos(nivelMaximoPeligrosidad).isEmpty()
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa => cosa.peso().between(min, max)})
	}

	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
//totalBultos(): la suma de la cantidad de bultos que está transportando.
//KnightRider, arena a granel y residuos radioactivos son 1 bulto. Bumblebee y embalaje de seguridad son dos. 
//Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más. 
//Batería antiaérea: 1 si no tiene misiles, 2 si tiene. 
//Contenedor portuario: 1 + los bultos que tiene adentro.
	/*method totalBultos(){
		var bultos1 = [knightRider, arenaAGranel, residuosRadioactivos]
		var bultos2 = [bumblebee, embalajeDeSeguridad]
		if (ladrillos.cantidad().between(1,101)){
			bultos1.add(ladrillos)
		}
		else if (ladrillos.cantidad().between(101,300)){
			bultos2.add(ladrillos)
		}
		else {}
	}*/ 
	
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
}

