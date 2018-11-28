module ParkingSpots
  class FindFree
    attr_reader :size

    def self.call(size:)
      new(size).call
    end

    def initialize(size)
      @size = size
    end

    def call
      ParkingSpot
        .by_size(size)
        .available
        .joins(:parking_level)
        .order("parking_levels.floor_number ASC")
        .first
    end
  end
end
