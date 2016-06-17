class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)

    respond_to do |format|
      if @product.save
        format.js 
        format.html {render action: 'new'}
      else
        format.html { render action: "new" }
      end
    end
  end

  private
    def params_product
      params.require(:product).permit(:title, images_attributes: [:id, :file])
    end
end