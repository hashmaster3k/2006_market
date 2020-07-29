class Item

  attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price].split("$")[1].to_f.round(2)
  end
end
