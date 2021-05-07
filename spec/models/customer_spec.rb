require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with valid attributes' do
    customer = Customer.new(
      name: 'Jhon',
      first_name: 'Doe',
      phone: '0912123213',
      address_street: 'road 23, somewhere',
      address_zipcode: 10212,
      address_city: 'London',
      address_country: 'England',
      bank_account_no: 'alphanumeric1245',
      bank_name: 'royal_bank_of_london_etc',
      email: 'jhon_doe@email.com'
    )
  end

  it 'is not valid without valid attributes' do
    expect(Customer.new).to_not be_valid
  end
end
