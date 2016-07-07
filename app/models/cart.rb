class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    return total
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id) 
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id, quantity: 1)
    end
    line_item
  end

end