# Each shopping cart has a collection of products. It should also have the following functionality:

# add a product to the cart
# remove a product from the cart
# add up the total cost of all products in the cart before tax
# add up the total cost of all products in the cart after tax
require "pry"
require_relative("product")


class Shopping_cart

  @@shopping_cart = []


  def initialize
    @base_price = base_price
    @full_price = full_price
  end


  def add_product(name, base_price, category)
    new_product = Product.new(name, base_price, category)
    @@shopping_cart << new_product
    return new_product
  end

  def self.delete_product(product)
      @@shopping_cart.delete(product)
  end

  def self.total_cost_before_tax
    total_cost_before_tax = 0
    @@shopping_cart.each do |product|
      # puts product.base_price
      total_cost_before_tax += product.base_price
    end
      return total_cost_before_tax
  end

  def self.total_cost_after_tax
    total_cost_after_tax = 0
    @@shopping_cart.each do |product|
      # puts product.full_price
        total_cost_after_tax += product.full_price
    end
    return total_cost_after_tax
  end

  def self.contains
    @@shopping_cart
  end
  
  def full_price
    @full_price
  end

  def base_price
    @base_price
  end

end

# banana = Product.new("banana", 0.57, "exempt")
# candy = Producst.new("candy", 1.50, "full")
# book = Product.new("book", 18.00, "redux")

new_shopping_cart = Shopping_cart.new

banana = new_shopping_cart.add_product("banana", 0.57, "exempt")
candy = new_shopping_cart.add_product("candy", 1.50, "full")
book = new_shopping_cart.add_product("book", 18.00, "redux")
puts "Shopping cart contains:"
puts Shopping_cart.contains.inspect

Shopping_cart.delete_product(banana)
puts "Shopping cart after delete contains:"
puts Shopping_cart.contains.inspect

puts "total_cost_before_tax:"
puts Shopping_cart.total_cost_before_tax

puts "total_cost_after_tax:"
puts Shopping_cart.total_cost_after_tax
