class Product
  @@products = []
  def initialize(name, base_price)
    @name = name
    @base_price = base_price
    @tax_rate = 0.03
  end
  def total_price
    @base_price*(@tax_rate + 1)
   end
  def name
    @name
  end
  def base_price
    @base_price
  end
  def self.create(n, b)
    @@products.push(Product.new(n, b))
    @@products[@@products.length - 1]
  end
  def self.products
    @@products
  end
end

# product1 = Product.create("bread", 20)
# product2 = Product.create("butter", 10)
# product3 = Product.create("chicken", 30)

# p Product.products
