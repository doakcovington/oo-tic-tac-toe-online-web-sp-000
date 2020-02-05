class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],#top row 0
    [3,4,5],#middle row 1
    [6,7,8],#bottom row 2
    [0,3,6],#left column 3
    [1,4,7],#middle column 4
    [2,5,8],#right column 5
    [0,4,8],#top left to bottom right 6
    [2,4,6]#top right to bottom left 7
  ]

  def initialize
    @board = Array.new(9, " ") # creates new array that contains 9 elements
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

  def move(index,token)
    @board[index]=token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      puts "Sorry, that position is taken"
      false
    else
      true
    end
  end

  def valid_move?(index)
    valid = false
    if index.between?(0,8) && position_taken?(index) == false
      valid = true
    end
    valid
  end

  def turn_count
    @count = 0
    @board.each do |token|
      if token == "X" || token == "O"
        @count += 1
      end
    end
    @count
  end

  def current_player
    #player = nil
    if turn_count % 2 == 0
      #player == "X"
      "X"
    else
      #player == "O"
      "O"
    end
    #player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index)
      move(index,token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "O" && @board[combo[3]] == "X"
        return combo
      elsif [combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[3]] == "O"

      end
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    result = won?
    if result
      return @board[result[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congradulation #{winner(@board)}"
    else
      puts "Cat's Game!"
    end
  end

end
