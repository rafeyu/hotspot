class CreateHotspot < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :user
      t.integer :price
      t.integer :debt
      t.integer :total

      t.timestamps
    end
  end
end
