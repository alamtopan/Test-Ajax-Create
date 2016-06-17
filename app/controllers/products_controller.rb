class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)

    # PROSES AJAX JS RAILS CREATE.JS.ERB
    respond_to do |format|
      if @product.save
        format.js 
        format.html {render action: 'new'}
      else
        format.html { render action: "new" }
      end
    end

    # PROSES AJAX MANUAL
    # if @product.save
    #   render json: {
    #     location: "#{new_product_path}", status: true
    #   }
    # else
    #   render :new
    # end
  end

  private
    def params_product
      params.require(:product).permit(:title, images_attributes: [:id, :file])
    end
end