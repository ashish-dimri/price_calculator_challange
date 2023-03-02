# Author: Ashish Dimri

require_relative './item'
require 'terminal-table'

$items = []
$item_data = []
$total_discounted_price = 0
$total_price = 0

# Get user items by taking input from the user
# Add items to the list of items
# Generate bill for the added items

def get_user_items
	puts "Please enter all the items purchased separated by a comma"
  	$items = gets.chomp.delete(" ").split(',')

  	add_item("milk") if $items.include?("milk")
  	add_item("bread") if $items.include?("bread")
  	add_item("apple") if $items.include?("apple")
  	add_item("banana") if $items.include?("banana")
  	generate_bill
end

# Initialize item and add item to the list for billing

def add_item(item_name)
	quantity = $items.count(item_name)
	item = Item.new(item_name, quantity)
	$item_data << [item.name.capitalize(), item.quantity, "$#{item.discounted_price.round(2)}"]
	$total_price += item.price
	$total_discounted_price += item.discounted_price
end

# Use terminal table to show table structure
# User billing list to display the data
# Display total discounted price and saved amount on the bill

def generate_bill
	items_table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $item_data
	puts items_table
	amount_saved = $total_price - $total_discounted_price
	puts "Total price : $#{$total_discounted_price.round(2)}"
	puts "You saved $#{amount_saved.round(2)} today."
end

# Program starts to take user input

get_user_items
