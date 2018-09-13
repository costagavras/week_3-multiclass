# Each product has a name, base price, and tax rate. There should also be a method to calculate and return the product's total price based on the base price
# and tax rate.
class Product

  def initialize(name, base_price, category)
    @name = name
    @base_price = base_price
    if category == "full"
      @sales_tax = 0.15
    elsif category == "redux"
      @sales_tax = 0.05
    elsif category == "exempt"
      @sales_tax = 0
    end
    @full_price = @base_price * (1 + @sales_tax)
  end

  def full_price
    @full_price = @base_price * (1 + @sales_tax)
  end

  def base_price
    @base_price
  end

end

banana = Product.new("banana", 0.57, "exempt")
candy = Product.new("candy", 1.50, "full")
book = Product.new("book", 18.00, "redux")
puts banana.full_price
puts candy.full_price
puts book.full_price
