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
