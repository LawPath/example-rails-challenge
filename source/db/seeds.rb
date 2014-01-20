# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Customer 1
customer = Customer.create({ :first_name => 'Johny', :last_name => 'Flow'})

for i in 1..5
  charge = Charge.new
  charge.created = Time.new
  charge.paid = true
  charge.amount = 4900
  charge.currency = 'usd'
  charge.refunded = false
  charge.customer_id = customer.id
  charge.save
end

for i in 1..3
  charge = Charge.new
  charge.created = Time.new
  charge.paid = true
  charge.amount = 4900
  charge.currency = 'usd'
  charge.refunded = true
  charge.customer_id = customer.id
  charge.save
end

#Customer 2
customer = Customer.create({ :first_name => 'Raj', :last_name => 'Jamnis'})

for i in 1..3
  charge = Charge.new
  charge.created = Time.new
  charge.paid = true
  charge.amount = 4900
  charge.currency = 'usd'
  charge.refunded = false
  charge.customer_id = customer.id
  charge.save
end

for i in 1..2
  charge = Charge.new
  charge.created = Time.new
  charge.paid = true
  charge.amount = 4900
  charge.currency = 'usd'
  charge.refunded = true
  charge.customer_id = customer.id
  charge.save
end

#Customer 3
customer = Customer.create({ :first_name => 'Andrew', :last_name => 'Chung'})

charge = Charge.new
charge.created = Time.new
charge.paid = true
charge.amount = 4900
charge.currency = 'usd'
charge.refunded = false
charge.customer_id = customer.id
charge.save

for i in 1..3
  charge = Charge.new
  charge.created = Time.new
  charge.paid = false
  charge.amount = 4900
  charge.currency = 'usd'
  charge.refunded = false
  charge.customer_id = customer.id
  charge.save
end

#Customer 4
customer = Customer.create({ :first_name => 'Mike', :last_name => 'Smith'})

charge = Charge.new
charge.created = Time.new
charge.paid = true
charge.amount = 4900
charge.currency = 'usd'
charge.refunded = false
charge.customer_id = customer.id
charge.save

for i in 1..2
  charge = Charge.new
  charge.created = Time.new
  charge.paid = false
  charge.amount = 4900
  charge.currency = 'usd'
  charge.refunded = false
  charge.customer_id = customer.id
  charge.save
end
