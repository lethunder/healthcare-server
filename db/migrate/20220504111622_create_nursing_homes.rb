class CreateNursingHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :nursing_homes do |t|
      t.string :name, null: false
      t.references :location

      t.timestamps
    end

  end
end
