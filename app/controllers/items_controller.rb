class ItemsController < ApplicationController
  before_action :set_item, :only => [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_url
    else
      render :action => :new
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    
    @item.destroy

    redirect_to items_url
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :date, :description)
  end
end
