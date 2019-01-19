class AddDeletedToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :deleted, :boolean, null: false, default: false
  end
end
