class AddRememberMeToUser < ActiveRecord::Migration
  def change
    add_column :users, :remember_me, :string
  end
end
