# frozen_string_literal: true
#
# Robot that follows 3 instructions: turn left, turn_right, advance

require 'byebug'

class Robot
  VALID_ORIENTATION = %i[east west north south].freeze

  attr_reader :bearing

  # initialize the robot
  def initialize(bearing = :north)
    @bearing = bearing
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
  def turn_left
    3.times do
      @bearing = turn_right
    end
  end
end
