class AddIsUserStatusToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_user_status, :boolean, default: false, null: false
  end
end
