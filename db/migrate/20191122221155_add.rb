class Add < ActiveRecord::Migration[6.0]
  def change
      add_column :tasks, :priority, :integer
      add_column :lists, :priority, :integer
  end
end
