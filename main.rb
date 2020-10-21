# frozen_string_literal: true

require 'pry'
require_relative 'simulation'
require_relative 'board'
require_relative 'object'
require_relative 'display'

simulation_0 = Simulation.new
simulation_0.start

binding.pry
