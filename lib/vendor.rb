class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    total = 0
    @inventory.each do |item|
      total += item[0].price * item[1]
    end
    total
  end
end
