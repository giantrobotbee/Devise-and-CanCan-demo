class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :name
      t.timestamps
      t.references :user
    end
  end

  def self.down
    drop_table :things
  end
end
