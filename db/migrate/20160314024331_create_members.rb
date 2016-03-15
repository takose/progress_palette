class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :user
      t.string :name
      t.string :progress
      
      t.timestamps null: false
    end
  end
end
