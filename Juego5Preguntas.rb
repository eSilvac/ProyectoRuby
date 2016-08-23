require 'io/console'


class Juego 
	attr_accessor :cont, :preg, :res

	def initialize(preg,res)
		@cont = 0
		@preg = preg
		@res = res
	end

	def actual
		@preg[cont]
	end

	def validacion(resPersona)
		prueba = @res[cont].to_s
		if resPersona == prueba
			puts "que si"	
		else
			puts "que no"
		end

		puts @res[cont]
		puts resPersona
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
			    		@res[i] = linea.gsub!(/\s+/, '')
						i+=1 	
			    	end
			  	end
			end
		end
end


game2 = PreguResp.new
pregunta = game2.preg
respuesta = game2.res
contPrincipal = 0
numeroPregunta = { 0 => "Primera pregunta: "}

puts ""
puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Preciona cualquier caracter para comenzar."
STDIN.getch

game1 = Juego.new(pregunta,respuesta)

while contPrincipal < 5
	puts ""
	print numeroPregunta[contPrincipal]
	puts game1.actual
	print "=>"
	resPersona = gets.chomp
		if game1.validacion(resPersona)
			puts "Respuesta Correcta!"
			contPrincipal += 1
		else
			puts "Respuesta Incorrecta, vulve a intentar"
		end
end

game1.actual


































