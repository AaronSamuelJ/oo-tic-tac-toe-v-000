require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
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
  def move(player, char)
    @board[player] = char
  end
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  def valid_move?(index)
    index.to_i.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn
    puts "Please make a move between(1-9):"
    input = gets.strip
    user_input = input_to_index(input)
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.find do |combo|
      position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    end
  end
  def full?
    @board.all?{|token| token == "X" || token =="O"}
  end
  def draw?
    full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    if won? && @board[won?[0]] == "X"
      "X"
    elsif won? && @board[won?[0]] == "O"
      "O"
    end
  end
end
