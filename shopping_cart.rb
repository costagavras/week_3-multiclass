# Each shopping cart has a collection of products. It should also have the following functionality:

# add a product to the cart
# remove a product from the cart
# add up the total cost of all products in the cart before tax
# add up the total cost of all products in the cart after tax
require "pry"
require_relative("product")

class ShoppingCart

  @@shopping_cart = []

  def add_product(name, base_price, quantity, category)
    new_product = Product.new(name, base_price, quantity, category)
    @@shopping_cart << new_product
    return new_product
  end

  def self.delete_product(product)
    @@shopping_cart.delete(product)
  end

  # Incuding Stretch 2: associate quantity
  def self.total_cost_before_tax
    total_cost_before_tax = 0
    @@shopping_cart.each do |product|
      total_cost_before_tax += product.base_price * product.quantity
    end
    return total_cost_before_tax.round(2)
  end

  # Incuding Stretch 2: associate quantity
  def self.total_cost_after_tax
    total_cost_after_tax = 0
    @@shopping_cart.each do |product|
      total_cost_after_tax += product.full_price * product.quantity
    end
    return total_cost_after_tax.round(2)
  end

  def self.contains
    @@shopping_cart
  end

  # Stretch 1. Add the ability to find the most expensive product in a cart.
  def self.most_expensive_product
    max_price = 0
    max_price_product = ""
    ShoppingCart.contains.each do |product|
      if max_price < product.full_price
        max_price = product.full_price.round(2)
        max_price_product = product.name
      end
    end
    puts "The most expensive product is *#{max_price_product}* and its price is #{max_price} tax included."
  end

end

# banana = Product.new("banana", 0.57, "exempt")
# candy = Producst.new("candy", 1.50, "full")
# book = Product.new("book", 18.00, "redux")

new_shopping_cart = ShoppingCart.new

banana = new_shopping_cart.add_product("banana", 0.57, 3, "exempt")
candy = new_shopping_cart.add_product("candy", 1.50, 5, "full")
book = new_shopping_cart.add_product("book", 18.00, 2, "redux")
puts "Shopping cart contains:"
puts ShoppingCart.contains.inspect

ShoppingCart.delete_product(banana)
puts "Shopping cart after delete contains:"
puts ShoppingCart.contains.inspect

puts "total_cost_before_tax:"
puts ShoppingCart.total_cost_before_tax

puts "total_cost_after_tax:"
puts ShoppingCart.total_cost_after_tax

puts "Stretch1: max price and product:"
puts ShoppingCart.most_expensive_product
