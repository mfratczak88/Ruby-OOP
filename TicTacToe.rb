
class Player
  attr_accessor :name, :player_arr
  def initialize
    puts "Type in your name"
      @name=gets.chomp.to_s
      @player_arr=[]
  end
end

class Board 
  attr_accessor :cells, :board
  
  def initialize
    @cells=*(0..9)
    @cells[0]="X"
  end

  def board
    puts "\n"
    puts "#{@cells[1]} | #{@cells[2]} | #{@cells[3]} "
    puts "--+---+--+"
    puts "#{@cells[4]} | #{@cells[5]} | #{@cells[6]} "
    puts "--+---+--+"
    puts "#{@cells[7]} | #{@cells[8]} | #{@cells[9]} "
    puts "--+---+--+"
  end
end 

class Game
  attr_accessor :cells, :board
  
  def initialize
    @player1=Player.new
    @player1_arr=@player1.player_arr
    @player2=Player.new
    @player2_arr=@player2.player_arr
    @board=Board.new
    @cells=@board.cells
    play
  end

  def victory(player_arr,player)
	  win_arr = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	  if win_arr.any? {|win| win.all? { |i| player_arr.include?(i)}}
	    puts "You won #{player}"
	    return true
	  end 
  end

	def draw
  	if @cells.all? { |i| i=="X" || i=="O"}
     	puts "DRAW !"
  	end
	end

	def taken?(input)
	  until @cells[input].class!=String
		puts "Taken, please choose a free number"
		input=gets.chomp.to_i
	  end
	end



  def play
		turn=1
		until victory(@player1_arr,@player1.name) || victory(@player2_arr,@player2.name) || draw

			if turn==1
				@board.board
				puts "Where to put X #{@player1.name} ?"
				input=gets.chomp.to_i
				taken?(input)
				@cells[input]="X"
				@player1_arr<<input
				turn=0
			else
				@board.board
				puts "Where to put O #{@player2.name} ?"
				input=gets.chomp.to_i
				taken?(input)
				@cells[input]="0"
				@player2_arr<<input
				turn=1
			end
		end
  end
end

Game.new