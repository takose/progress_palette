class AddColumnToMember < ActiveRecord::Migration
  def change
    add_column :members, :url, :string
  end
end
