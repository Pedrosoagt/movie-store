class CreateMovie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :year

      t.timestamps null: false
    end
  end
end
