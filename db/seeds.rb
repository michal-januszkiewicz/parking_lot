ParkingSpot.destroy_all
ParkingLevel.destroy_all

(0..5).each do |i|
  parking_level = ParkingLevel.create(floor_number: i)
  (1..20).each do |j|
    ParkingSpot.create(
      spot_number: j,
      size: ParkingSpot::SIZES.sample,
      taken: [true, false].sample,
      parking_level_id: parking_level.id
    )
  end
end
