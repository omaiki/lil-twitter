class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :phone

      t.timestamps null: false
    end
  end
end
