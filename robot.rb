# frozen_string_literal: true

#
# Robot that follows 3 instructions: turn left, turn_right, advance

require 'byebug'

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
