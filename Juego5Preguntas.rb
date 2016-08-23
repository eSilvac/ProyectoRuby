class Juego
	attr_accessor :cont

	def intialize
		@cont = 0
	end

	def actual(a)
		puts a
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
			    		@res[i] = linea
						i+=1 	
			    	end
			  	end
			end
		end
end

game1 = Juego.new
game2 = PreguResp.new
puts game2.preg
puts game2.res

puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Preciona cualquier caracter para comenzar"

game1.actual(0)
