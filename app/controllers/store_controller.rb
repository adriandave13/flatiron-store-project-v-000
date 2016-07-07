class StoreController < ApplicationController

  def index
    @items = Item.available_items.order(:title)
    @categories = Category.order(:title)
  end
  
end
