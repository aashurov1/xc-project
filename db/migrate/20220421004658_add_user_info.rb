class AddUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false   
  end
end