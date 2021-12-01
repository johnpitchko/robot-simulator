# Write your code for the 'Robot Simulator' exercise in this file. Make the tests in
# `robot_simulator_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/robot-simulator` directory.

# frozen_string_literal: true

# Robot simulator
require 'byebug'
require_relative 'robot'

class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }.freeze

  # Translate an instruction string into the instruction symbols that the robot understands
  def instructions(instruction_string)
    instruction_string.split(//).map { |c| INSTRUCTIONS[c] }
  end

  # Initialize a robot at a specific position and direction
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  # Send an entire string of commands to a robot
  def evaluate(robot, instruction_string)
    instructions(instruction_string).each { |ins| robot.send(ins) }
  end
end

# Robot that follows 3 instructions: turn left, turn_right, advance
class Robot
  VALID_ORIENTATION = %i[east west north south].freeze

  attr_reader :bearing, :coordinates

  # initialize the robot
  def initialize(bearing = :north, _coordinates = [0, 0])
    @bearing = bearing
    @coordinates = [0, 0]
  end

  # Reorients the robot to a specific direction
  def orient(bearing)
    raise ArgumentError unless VALID_ORIENTATION.include? bearing

    @bearing = bearing
  end

  # Turn the robot right from current bearing
  def turn_right
    @bearing = case bearing
               when :north
                 :east
               when :east
                 :south
               when :south
                 :west
               when :west
                 :north
               end
  end

  # Turn the robot left from current bearing
  # Turning the robot right 3x is the same as turning left (also saves repeating my typing)
  def turn_left
    3.times do
      @bearing = turn_right
    end
  end

  # Place the robot at specific coordinates
  def at(x_pos = 0, y_pos = 0)
    @coordinates = [x_pos, y_pos]
  end

  # Move the robot forward based on orientation
  def advance
    new_coords = case @bearing
                 when :north
                   [0, 1]
                 when :east
                   [1, 0]
                 when :south
                   [0, -1]
                 when :west
                   [-1, 0]
                 end

    # Some funky matrix addition...
    @coordinates = [@coordinates, new_coords].transpose.map(&:sum)
  end
end
