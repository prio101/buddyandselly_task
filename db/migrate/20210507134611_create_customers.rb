class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string  :name
      t.string  :first_name
      t.string  :phone
      t.string  :address_street
      t.integer  :address_zipcode, limit: 3
      t.string  :address_city
      t.string  :address_country
      t.string  :bank_account_no
      t.string  :bank_name
      t.string  :email
      t.timestamps
    end
  end
end
