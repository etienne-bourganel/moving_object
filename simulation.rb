# frozen_string_literal: true

class Simulation

  def initialize
    @board = create_board
    @object = create_object
  end

  # Ask for board's dimensions and create it
  def create_board
    Display.input_board_width
    width = gets.chomp.to_i
    Display.input_board_height
    height = gets.chomp.to_i
    return Board.new(width, height)
  end

  # Ask for initial x & y for object
  def create_object
    Display.input_moving_object_initial_x
    x = gets.chomp.to_i
    Display.input_moving_object_initial_y
    y = gets.chomp.to_i
    return Moving_object.new(x, y)
  end

  # Simulation start and logic
  def start
    @continue = true
    while (is_object_on_board? && @continue)
      manage_input
    end
    results
  end

  # Check if object is still on the board
  def is_object_on_board?
    @board.matrix.any? do |element|
      element == @object.current_position
    end
  end

  # Get input from user
  def get_input
    Display.input_command
    input = gets.chomp.to_i
  end

  # Treat input 
  def treat_input(input)
    case input
    when 0
      @continue = false
    when 1..4
      send_instructions(input)
    else 
      Display.error_input
      get_input
    end
  end

  # Whole input thing
  def manage_input
    treat_input(get_input)
  end

  # Send instructions to moving object
  def send_instructions(input)
    case input
    when 1
      @object.move_forwards
    when 2
      @object.move_backwards
    when 3
      @object.turn_clockwise
    when 4
      @object.turn_counterclockwise
    end
  end

  def results
    if is_object_on_board?
      print @object.current_position
    else print [-1, -1]
    end
  end
end
