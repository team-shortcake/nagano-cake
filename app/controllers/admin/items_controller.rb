class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
       redirect_to admin_item_path(@item)
     else
      flash[:notice] = "空欄箇所を入力してください"
       redirect_to new_admin_item_path
     end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      flash[:notice] = "もう一度入力してください"
      redirect_to edit_admin_item_path(@item)
    end
  end

 private

 def item_params
    params.require(:item).permit(:genre_id, :price, :is_order_status, :name, :image, :explanation)
 end
end