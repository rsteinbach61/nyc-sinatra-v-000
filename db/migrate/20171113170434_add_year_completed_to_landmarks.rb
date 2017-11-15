class AddYearCompletedToLandmarks < ActiveRecord::Migration
  def up
    add_column :landmarks, :year_completed, :integer
  end

  def down
    remove_column :landmarks, :year_completed, :integer
  end
end
