class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.map do |vendor|
      vendor if vendor.inventory[item] != 0
    end.compact
  end

  def sorted_item_list
    result = []
    @vendors.each do |vendor|
      result << vendor.inventory.map {|item| item[0].name}
    end
    result.flatten.uniq.sort
  end
end
