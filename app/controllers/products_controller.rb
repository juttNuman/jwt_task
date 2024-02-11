class ProductsController < ApplicationController
	before_action :authenticate_request

  def index
    @products = Product.all
    render json: @products
  end

 
  def show
    render json: @product
  end
  
   def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private
   def product_params
      params.require(:product).permit(:name,:price)
    end

end
