class ParkingSpot < ApplicationRecord
  belongs_to :parking_level

  SIZES = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]

  validates :spot_number, :size, presence: true, numericality: { only_integer: true }
  validates :size, inclusion: { in: SIZES }
end
