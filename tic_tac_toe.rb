
#create and print board
class Game
  @@board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

  def print_board
    @@board.each{|row| p row}
  end
end

#allows creation of two players
class Player < Game
  attr_accessor :oppenent, :board
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
    ask_row()
    ask_column()
    if @@board[@row][@column] == " "
      @@board[@row][@column] = @team
      print_board()
      @@win = check_win()
      if @@win
        win()
      else
        @oppenent.place_piece
      end
    else
      puts "This spot is already occupied, choose an open space"
      print_board()
      self.place_piece()
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
  
    if (@@board[0][0] == @team && @@board[1][1] == @team && @@board[2][2] == @team)
      return true
    elsif (@@board[0][2] == @team && @@board[1][1] == @team && @@board[2][0] == @team)
      return true
    elsif @@board.all?{|row| row.all?{|column| column != " "}}
      tie
    else
      return false
    end
  end

  private
  def win
    puts "#{@name} Wins!"
    sleep 1
    replay
  end

  private
  def tie
    puts "Cats Game (Tie!)"
    sleep 1
    replay
  end
  private
  def replay
    puts "Would you like to play again? (y/n)" 
    anwser = gets.chomp.downcase
    if anwser == "y" || anwser == "yes"
      @@board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
      start_game()
    else
      exit
    end
  end

  private
  def ask_row
    puts "#{@name} What row would you like to place #{@team}? (1, 2, 3)"
    @row = gets.chomp.to_i
    unless @row == 1 || @row == 2 || @row ==3
      puts "Invalid input please input 1, 2, or 3."
      ask_row()
    else
      @row -= 1
    end

  end
  private
  def ask_column
    puts "#{@name} What column would you like to place #{@team}? (1, 2, 3)"
    @column = gets.chomp.to_i
    unless @column == 1 || @column == 2 || @column == 3
      puts "Invalid input please input 1, 2, or 3."
      ask_column()
    else
      @column -= 1
    end
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





  
