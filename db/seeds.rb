# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats.."
5.times do
  flat = Flat.create!(
    name: Faker::Name.middle_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: Faker::Lorem.paragraph,
    price_per_night: Faker::Number.number(digits: 2),
    number_of_guest: Faker::Number.number(digits: 1)

  )
  flat.save!
end
puts "Finished!"
