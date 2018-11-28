class ParkingLevel < ApplicationRecord
  has_many :parking_spots

  validates :floor_number, presence: true, numericality: { only_integer: true }
end
