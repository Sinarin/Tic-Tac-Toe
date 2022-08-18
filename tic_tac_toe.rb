board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

class Game
  @@board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

  def print_board
    #TODO
  end
end

class Player < Game
  attr_accessor :oppenent
  @@win = false
  @@player = 1
  def initialize(name = "Player #{@@player}", team)
    @name = name
    @team = team
    @oppenent = nil
    if @@player == 2
      @@player = 1
    end
    @@player += 1 
  end

  
  def place_piece
    puts "#{@name} What row would you like to place #{@team}"
    row = gets.chomp.to_i - 1
    puts "#{@name} What column would you like to place #{@team}"
    column = gets.chomp.to_i - 1
    @@board[row][column] = @team
    print_board()
    @@win = check_win()
    if @@win
      win()
    else
      @oppenent.place_piece
    end
  end
  
  private
  def check_win
    @@board.each_with_index do |row, index|
      if row.all?{|column| column == @team}
        return true  
      end
    end
  
    for i in 0..2
      if @@board.all?{|row| row[i] == @team}
        return true
      end
    end
  
    if @@board[0][0] == @team && @@board[1][1] == @team && @@board[2][2] = @team
      return true
    elsif @@board[0][2] == @team && @@board[1][1] == @team && @@board[2][0] = @team
      return true
    else
      return false
    end
  end

  private
  def win
    puts "#{@name} Wins!"
    sleep 1
    puts "Would you like to play again?"
  
  end

end

#initializes each player, sets opponenent and starts game
def start_game
  player1 = Player.new("Player 1", "X")
  player2 = Player.new("Plyaer 2", "O")
  player1.oppenent = player2
  player2.oppenent = player1
  player1.place_piece
end

start_game()





  
