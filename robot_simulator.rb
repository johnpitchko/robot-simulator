=begin
Write your code for the 'Robot Simulator' exercise in this file. Make the tests in
`robot_simulator_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-simulator` directory.
=end

# frozen_string_literal: true

# Robot simulator
require 'byebug'

class Simulator
  INSTRUCTIONS = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}.freeze

  def initialize
  end

  def instructions(instruction)
    [INSTRUCTIONS[instruction]]
  end
end
