class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @items = current_user.current_cart.items
  end

 def checkout
    remove_item
    current_user.remove_cart
    redirect_to cart_path(current_user)
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def remove_item
    current_user.current_cart.line_items.each do |item|
      @item = Item.find(item.item_id)
      @item.inventory -= item.quantity
      @item.save
    end
  end

end
