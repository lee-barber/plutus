class AddPurchasedOnToCoin < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :purchased_on, :date
  end
end
