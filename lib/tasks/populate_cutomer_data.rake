require 'csv'

namespace :csv_worker do
  desc 'Populate customer data from the CSV to the database customer table.'

  task  populate_customer: :environment do
    puts "Populating the customer database table"
    file =  File.read("#{Rails.root}/customer_test.csv")
    csv = CSV.parse(file, headers: true)

    # will run the csv object and populate the database
    
    csv.each do |row|
      row.to_hash
      data_generate(row)
      # or you can also use this one
      # see below for the reference
      # another_data_generate(row)
    end
    puts '\n'
    puts '-'*10
    puts 'Completed'
  end
  
  private

  def data_generate(row)
    begin
      Customer.create!(
        name:  row['name'],
        first_name: row['first_name'],
        phone: row['phone'],
        address_street: row['address_street'],
        address_zipcode: row['address_zipcode'],
        address_city: row['address_city'],
        address_country: row['address_country'],
        bank_account_no: row['bank_account_no'],
        bank_name: format_date(row['bank_name']),
        email: row['email']
      )
    rescue => exception
      raise ActiveRecord::Rollback, "There are errors -> #{exception.message}"
    end
  end

  def another_data_generate(row)
    @customer = Customer.new

    ActiveRecord::Base.transaction do
      @customer.assign_attirbutes({
        name:  row['name'],
        first_name: row['first_name'],
        phone: row['phone'],
        address_street: row['address_street'],
        address_zipcode: row['address_zipcode'],
        address_city: row['address_city'],
        address_country: row['address_country'],
        bank_account_no: row['bank_account_no'],
        bank_name: format_date(row['bank_name']),
        email: row['email']
      })

      # if not save
      unless @customer.save!
        raise ActiveRecord::Rollback, @cutomer.errors.full_messages
      else
        p '.'
      end
    end
  end
end



