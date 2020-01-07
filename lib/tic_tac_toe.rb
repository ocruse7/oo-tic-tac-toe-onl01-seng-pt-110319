class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], #Top Row`
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], # \ 
    [2,4,6] # /
    ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, userToken = "X")
    @board[index] = userToken
  end
  
  def position_taken? (index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(position)
    position.between?(0,8) && position_taken?(position) == FALSE
  end
  
  def turn()
    puts "Please enter between 1-9"
    index = gets.chomp
    index = input_to_index(index.to_i)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    number_of_turns = 0
    @board.each do |space|
    if space == "X" || space == "O"
        number_of_turns += 1
        end
    end
      return number_of_turns
  end

  def current_player
      if turn_count % 2 == 0
      "X"
      else
      "O"
    end
  end
  
  def won?()
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" 
        return combo
      else
        false
      end
    end
  end
  
  def full?()
    @board.each do |space|
      if space == " "
        return false
      end
    end
    return true
  end
  
  def draw?()
    !(won?) && (full?)
  end
  
  def over?()
    won? || full? || draw?
  end
        
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end
  
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end