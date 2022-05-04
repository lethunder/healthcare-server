class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations, if_not_exists: true do |t|
      t.string :street_name
      t.string :country_iso2, index: true, null: false
      t.float :latitude, index: true, null: false
      t.float :longitude, index: true, null: false
      t.string :formatted_address
      t.string :postal_code, index: true
      t.string :street_number
      t.string :street_type
      t.string :city_name, index: true
      t.references :locationable, polymorphic: true, index: true, null: false, type: :uuid

      t.timestamps
    end
    add_reference :users, :location
  end
end
