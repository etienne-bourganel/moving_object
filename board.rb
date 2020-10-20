# frozen_string_literal: true

class Board
  def initialize(width, height)
    @matrix = create_matrix(width, height)
    p @matrix
  end

  def create_matrix(width, height)
    matrix = []
    (0..width-1).each do |x|
      (0..height-1).each do |y|
        matrix.push([x, y])
      end
    end
    return matrix
  end
end