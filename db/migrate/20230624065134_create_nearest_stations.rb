class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.string :route_name
      t.string :station_name
      t.string :walking_minutes
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
