class AddColumnToMemberAchievement < ActiveRecord::Migration
  def change
    add_column :members, :achievement, :integer
  end
end
