class Board 
	def initialize n
		@arr=Array.new(n)
		i=0
		puts
		while i<@arr.length
			j=0
			@arr[i]=Array.new(n)
			while j<@arr[i].length
				@arr[i][j]="*"
				j=j+1
			end
			i=i+1
		end
		puts "BOARD MADE WITH SIZE : #{n}"
	end

	def print_b
		@arr.each do |x|
			x.each do |y|
				print" #{y}"
			end
			puts
		end
	end

	def change_b i,j,sym
		@arr[i][j]=sym;

	end

	def valid_turn i,j
		if i>=@arr.length
			return false
		end
		if j>=@arr.length
			return false
		end
		if @arr[i][j]!="*"
			return false
		end
		return true
	end


 ##checks for the symbol sent if it satisfies one of 2n+2 possiblities 
	def b_check sym  
		#check rows
		i=0
		while i<@arr.length
			game_finished=true
			j=0
			while j<@arr.length
				if @arr[i][j]!=sym
					game_finished=false
					break
				end
				j=j+1
			end
			if game_finished
				return game_finished
			end
			i=i+1
		end
		# check colmns
		i=0
		while i<@arr.length
			game_finished=true
			j=0
			while j<@arr.length
				if @arr[j][i]!=sym
					game_finished=false
					break
				end
				j=j+1
			end
			if game_finished
				return game_finished
			end
			i=i+1
		end
		#check diagonals
		i=0
		game_finished=true
		j=@arr.length-1
		while i<@arr.length
			if @arr[i][j]!=sym
				game_finished=false
				break
			end
			i=i+1
			j=j-1
		end
		if game_finished
			return game_finished
		end

		i=0
		game_finished=true
		j=0
		while i<@arr.length
			if @arr[i][j]!=sym
				game_finished=false
				break
			end
			i=i+1
			j=j+1
		end
		if game_finished
			return game_finished
		end
		return false
	end

	def check_draw
		@arr.each do |x|
			x.each do |y|
				if y=="*"
					return false
				end
			end
		end
		return true
	end
end