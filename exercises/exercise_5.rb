require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Calculations
total_revenue = Store.sum(:annual_revenue)
puts "Total revenue is #{total_revenue}"

average_revenue = total_revenue / Store.count
puts "Average revenue is #{average_revenue}"

high_revenue_stores = Store.where("annual_revenue >= ?", 1000000).count
puts "High revenue stores amount is #{high_revenue_stores}"