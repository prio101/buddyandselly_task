class Customer < ApplicationRecord

  validate_presence_of  :name,  :first_name, :address_street, :phone, :address_zipcode, 
                        :address_city, :address_country, :bank_account_no, 
                        :bank_name, :email

  validates_numericality_of  :address_zipcode, only_integer: true

  validate_format_of  :email, with: URI::MailTo::EMAIL_REGEXP
end
