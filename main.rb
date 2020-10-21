# frozen_string_literal: true

require 'pry'
require_relative 'board'
require_relative 'object'
require_relative 'display'

# Create board based on user's input
Display.input_board_width
width = gets.chomp.to_i
Display.input_board_height
height = gets.chomp.to_i

board = Board.new(width, height)

# Define moving object's initial position based on user's input
Display.input_moving_object_initial_x
x = gets.chomp.to_i
Display.input_moving_object_initial_y
y = gets.chomp.to_i

object_1 = Moving_object.new(x, y)

# Confirmation of the set-up
Display.confirmation(width, height, x, y)

# Simulation logic
def simulation(board, object)
  @continue = true
  while is_object_on_board?(board, object) && @continue == true
    get_input(object)
  end
end

# Check if object is still on the board
def is_object_on_board?(board, object)
  board.matrix.any? do |element|
    element == object.current_position
  end
end

# Get and treat input from user
def get_input(object)
  Display.input_command
  input = gets.chomp.to_i
  case input
  when 0
    @continue = false
  when 1..4
    send_instructions(input, object)
  else 
    Display.error_input
    get_input(object)
  end
end

# Send instructions to moving object
def send_instructions(input, object)
  case input
  when 1
    object.move_forwards
  when 2
    object.move_backwards
  when 3
    object.turn_clockwise
  when 4
    object.turn_counterclockwise
  end
end

def results(board, object)
  if is_object_on_board?(board, object)
    return object.current_position
  else return([-1, -1])
  end
end

def where_is_object(object)
  Display.object_position(object.current_position)
end

simulation(board, object_1)
results(board, object_1)
binding.pry