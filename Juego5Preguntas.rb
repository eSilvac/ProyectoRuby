require 'io/console'


class Juego

	attr_accessor :cont, :preg, :res

	attr_reader :juego

	def initialize
		@cont = 0
		@juego = PreguResp.new
		@preg = @juego.preg
		@res = @juego.res
	end

	def actual
		@preg[cont]
	end

	def validacion(resPersona)
		prueba = @res[cont].to_s
		if resPersona.casecmp(prueba) == 0
			@cont+=1
			return true	
		else
			return false
		end
	end
end

class PreguResp 

	attr_accessor :preg, :res
	
	def initialize
		@preg = []
		@res = []
		preguntas
		respuestas
	end

	private

		def preguntas
			i = 0
			File.open('preguntas.txt', 'r') do |f1|
			    while linea = f1.gets
			       	if linea.include? "(def)"
			    		linea.slice! "(def)"
			    		@preg[i] = linea
						i+=1
					end
			  	end
			end	
		end

		def respuestas
			i = 0
			File.open('preguntas.txt', 'r') do |f1|
			  	while linea = f1.gets
			    	if linea.include? "(res)"
			    		linea.slice! "(res)"
			    		linea.rstrip!
			    		@res[i] = linea
						i+=1 	
			    	end
			  	end
			end
		end
end

class Vidas 

	attr_accessor :numerovidas

	def initialize
		@numerovidas = ["❤" ,"❤" ,"❤" ,"❤" ,"❤"]
	end

	def bad
		@numerovidas.shift
	end

end



game1 = Juego.new
jugador = Vidas.new

contPrincipal = 0
numeroPregunta = { 0 => " Primera pregunta: ", 1 => " Segunda pregunta: ", 2 => " Tercera pregunta: ", 3 => " Cuarta pregunta: ", 4 => " Quinta pregunta: " }

puts ""
puts " Bienvenido a reto 5, Para jugar, solo ingresa el término correcto para cada una de las definiciones,tienes 5 vidas... Listo? Presiona cualquier caracter para comenzar."
STDIN.getch



while contPrincipal < 5
	puts ""	
	puts "           Numero de Vidas " + jugador.numerovidas.join(" ")
	puts ""
	print numeroPregunta[contPrincipal]
	print game1.actual
	puts ""
	print "=> "
	resPersona = gets.chomp
		if game1.validacion(resPersona)
			puts ""
			puts "Respuesta Correcta!"
			contPrincipal += 1
		else
			jugador.bad
			if jugador.numerovidas == [] 
				contPrincipal = 7 
			else	
				puts "Respuesta Incorrecta, vuelve a intentar"
			end

		end
end

if contPrincipal != 7 
	puts ""
	puts "      Felicitaciones, has terminado el Juego."
	puts ""
else
	puts ""
	puts "      Lo sentimos, has perdido."
	puts ""
end


































