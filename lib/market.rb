require 'date'

class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today
  end

  def date
    @date.strftime("%d/%m/%Y")
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

  def overstocked_items
    result = Hash.new{|hash, name| hash[name] = {}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        result[item[0]] = {vc: vendors_that_sell(item[0]).length,
                           ia: item[1]}
      end
    end
    result.find {|item| item[1][:vc] >= 2 && item[1][:ia] > 50}.first
  end

  def total_inventory
    result = Hash.new{|hash, name| hash[name] = {}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        result[item[0]] = {quantity: get_total_items(item),
                           vendors: vendors_that_sell(item[0])}
      end
    end
    result
  end

  def get_total_items(given)
    total = 0
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        total += item[1] if given[0] == item[0]
      end
    end
    total
  end

  def sell(item, amount)
    if get_total_items([item, 0]) < amount
      false
    else
      remove_quantity(item, amount)
      true
    end
  end

  def remove_quantity(item, number)
    @vendors.each do |vendor|
      require "pry"; binding.pry
    end
  end

end
