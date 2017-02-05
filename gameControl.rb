require_relative 'Board.rb' 
system("clear")
puts "TIC TAC TOE "
puts " IMP- PLS ENTER COORDINATES IN THE FORM 'XspaceY' , eg- 3 4"
puts "Enter Player 1 symbol : "
a=gets
puts "Enter Player 2 symbol : "
b=gets
puts "Enter Size of TIC-TAC-TOE : "
n=gets
size=n.to_i
GameBoard=Board.new size
GameBoard.print_b
turn=1  
while true
	puts "Player #{turn} enter coordinates x y  :"
	coords=gets
	words=coords.split(" ")
	while !(GameBoard.valid_turn words[0].to_i,words[1].to_i)
		puts "Player #{turn} enter coordinates x y :"
		coords=gets
		words=coords.split(" ")
	end
	if(turn==1)
		GameBoard.change_b words[0].to_i,words[1].to_i,a[0]
		GameBoard.print_b
		if GameBoard.b_check a[0]
			puts "Player #{turn} WINS !"
			break
		elsif GameBoard.check_draw
			puts "GAME DRAW"
			break
		end
		turn=2
	else
		GameBoard.change_b words[0].to_i,words[1].to_i,b[0]
		GameBoard.print_b
		if GameBoard.b_check b[0]
			puts "Player #{turn} WINS !"
			break
		elsif GameBoard.check_draw
			puts "GAME DRAW"
			break
		end
		turn=1
	end
end
