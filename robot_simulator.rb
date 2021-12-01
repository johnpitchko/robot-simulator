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

  # Translate an instruction string into the instruction symbols that the robot understands
  def instructions(instruction_string)
    instruction_string.split(//).map { |c| INSTRUCTIONS[c] }
  end
end
