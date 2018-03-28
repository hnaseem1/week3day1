require './product.rb'
class Cart
  @@products = []

  def self.add_product(name, base_price)
    @@products.push(Product.create(name, base_price))
  end

  def self.delete(name)
    @@products.each do |product|
      if product.name == name
        @@products.delete(product)
      end
    end
  end

  def self.total_before_tax
    total = 0
    @@products.each do |product|
      total += product.base_price
    end
    total
  end

  def self.total_after_tax
    total = 0
    @@products.each do |product|
      total += product.total_price
    end
    total
  end

  def self.products
    @@products
  end
end




cart1 = Cart.new

Cart.add_product("bread", 20)
Cart.add_product("butter", 8)
Cart.add_product("cream", 4)
p Cart.products
Cart.delete("cream")
p Cart.products
p Cart.total_before_tax
p Cart.total_after_tax
