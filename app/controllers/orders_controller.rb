class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.where({
      payed: false,
      user_id: current_user.id
    })
  end
  def create
    order = Order.new({
      product_id: params[:product_id],
      user_id: current_user.id 
    })
    order.save
    redirect_to products_path
  end
end
