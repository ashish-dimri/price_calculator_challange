# Author: Ashish Dimri

# Item class denotes single item attributes
class Item
	attr_reader :name, :quantity, :price, :discounted_price

	# Constructor of Item class
	# Constructor will recieve name and quantity of the item and calculate total and discounted price

	def initialize(name, quantity)
		@categories = get_all_categories
		@name = name
		@quantity = quantity
		@price = get_total_price
		@discounted_price = get_discounted_price
	end

	private

	# Returns predefined item categories and associated unit_price, sale_price and sale_quantity
	# Item may or may not have sale avaiable

	def get_all_categories
		{
			"milk"=> {
				"unit_price"=> 3.97,
				"sale_price"=> 2.5,
				"sale_quntity"=> 2
			},
			"bread"=> {
				"unit_price"=> 2.17,
				"sale_price"=> 2,
				"sale_quntity"=> 3
			},
			"banana"=> {
				"unit_price"=> 0.99
			},
			"apple"=> {
				"unit_price"=> 0.89
			}
		}
	end

	# Returns total price of a single category for the quantity provided

	def get_total_price
		@categories[@name]["unit_price"] * @quantity
	end

	# Returns discounted price of a single category if the item is in sale
	# If item is not in sale, it will return total price of a single category for the quantity provided
	# Returns discounted price or total price only if item name is predefined in categories.

	def get_discounted_price
		if @categories.has_key?(@name)
			unit_price = @categories[@name]["unit_price"]
			sale_price = @categories[@name]["sale_price"]
			sale_quntity = @categories[@name]["sale_quntity"]

			if sale_price && sale_quntity && @quantity >= sale_quntity
				calculate_discounted_price(unit_price, sale_price, sale_quntity)
			else
				unit_price * @quantity
			end
		end
	end

	# Calculate discounted price

	def calculate_discounted_price(unit_price, sale_price, sale_quntity)
		(@quantity/sale_quntity)*(sale_quntity*sale_price) + (@quantity%sale_quntity)*unit_price
	end
end