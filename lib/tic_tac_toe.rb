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

end
