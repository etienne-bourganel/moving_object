# frozen_string_literal: true

class Moving_object

  attr_reader :current_position, :direction_index, :direction
  @@DIRECTIONS = ["N", "E", "S", "W"]

  def initialize(x, y)
    @current_position = [x, y]
    @direction_index = 0
    update_direction
  end

  def update_direction
    @direction = @@DIRECTIONS[@direction_index]
  end

  def turn_clockwise
    case @direction_index
    when 0..2
      @direction_index += 1
      update_direction
    when 3 # Looping back
      @direction_index = 0
      update_direction
    end
  end

  def turn_counterclockwise
    case @direction_index
    when 1..3
      @direction_index -= 1
      update_direction
    when 0 # Looping back
      @direction_index = 3
      update_direction
    end
  end

  def move_forwards
    case @direction_index
    when 0 # Facing North
      @current_position[1] -= 1
    when 1 # Facing East
      @current_position[0] += 1
    when 2 # Facing South
      @current_position[1] += 1
    when 3 # Facing West
      @current_position[0] -= 1
    end
  end

  def move_backwards
    case @direction_index
    when 0 # Facing North
      @current_position[1] += 1
    when 1 # Facing East
      @current_position[0] -= 1
    when 2 # Facing South
      @current_position[1] -= 1
    when 3 # Facing West
      @current_position[0] += 1
    end
  end  
end
