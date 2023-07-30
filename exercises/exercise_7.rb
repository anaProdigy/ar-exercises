require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# VALIDATION

# Ask the user for a store name
puts "Enter the store name:"
store_name = gets.chomp

# Display the store name entered by the user
puts "You entered: #{store_name}"

# Assuming the 'annual_revenue' attribute is required by validations
puts "Enter the annual revenue for the store:"
annual_revenue = gets.chomp.to_i

puts "Does the store carry men's apparel? (true/false)"
carries_mens_apparel = gets.chomp.downcase == 'true'

puts "Does the store carry women's apparel? (true/false)"
carries_womens_apparel = gets.chomp.downcase == 'true'

store = Store.create(
  name: store_name,
  annual_revenue: annual_revenue,
  carries_mens_apparel: carries_mens_apparel,
  carries_womens_apparel: carries_womens_apparel
)

if store.save
  puts "Store created successfully"
else 
  puts " Errors occured while creating the store"
  store.errors.full_messages.each do |error_message|
    puts error_message
  end
end  
