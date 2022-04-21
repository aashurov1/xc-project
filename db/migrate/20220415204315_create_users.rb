class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
    end
    execute "SELECT setval('id', 1000)"
  end
end