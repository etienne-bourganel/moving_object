# frozen_string_literal: true

class Display
  def self.input_board_width
    puts "\nPlease enter the board's width:\n"
  end

  def self.input_board_height
    puts "\nPlease enter the board's height:\n"
  end

  def self.input_moving_object_initial_x
    puts "\nWhat is the inital x-position of the object?\n"
  end

  def self.input_moving_object_initial_y
    puts "\nWhat is the inital y-position of the object?\n"
  end

  def self.confirmation(width, height, x, y)
    puts "
    \nThe board's dimensions are (width: #{width}, height: #{height})
    \nThe moving object's starting position is (x: #{x}, y: #{y})\n"
  end

  def self.input_command
    puts "\nWhat is your next command?
    0: Quit simulation and display results
    1: Move object 1 step forwards 
    2: Move object 1 step backwards
    3: Turn object 90° clockwise
    4: Turn object 90° counterclockwise\n"
  end

  def self.error_input
    puts "\n Please choose a valid command."
  end

  def self.object_position(position)
    puts "\nThe object's position is #{position}"
  end

  def self.show_results(position)
    puts position
  end
end
