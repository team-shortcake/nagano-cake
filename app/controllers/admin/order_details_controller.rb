class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
      @order_detail = OrderDetail.find(params[:id])
      @order_detail.update(order_detail_params)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:quantity,:production_status,:item_with_tax)
    end
end