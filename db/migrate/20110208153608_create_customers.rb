class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.date :field1
      t.integer :field2
      t.integer :field3
      t.string :field4
      t.integer :field5

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
