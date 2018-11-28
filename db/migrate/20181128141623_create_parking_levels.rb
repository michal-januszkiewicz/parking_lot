class CreateParkingLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :parking_levels do |t|
      t.integer :floor_number, null: false

      t.timestamps
    end

    create_table :parking_spots do |t|
      t.integer :spot_number, null: false
      t.integer :size, null: false
      t.boolean :taken, null: false, default: false

      t.references :parking_level, foreign_key: true
      t.timestamps
    end
  end
end
