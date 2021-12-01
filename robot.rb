# frozen_string_literal: true
#
# Robot that follows 3 instructions: turn left, turn_right, advance

require 'byebug'

class Robot
  VALID_ORIENTATION = %i[east west north south].freeze

  attr_reader :bearing

  def initialize(bearing = :north)
    @bearing = bearing
  end

  def orient(bearing)
    raise ArgumentError unless VALID_ORIENTATION.include? bearing

    @bearing = bearing
  end

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
end
