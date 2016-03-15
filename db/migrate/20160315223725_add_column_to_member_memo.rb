class AddColumnToMemberMemo < ActiveRecord::Migration
  def change
    add_column :members, :memo, :text
  end
end
