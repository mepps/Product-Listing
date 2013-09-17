class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new	
	end

	def edit
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(name: params[:name], description: params[:description], pricing: params[:pricing])
		if @product.valid?
			@product.save
			redirect_to @product
		else

			redirect_to new_product_path, alert: @product.errors.full_messages.each {|message| message}
		end
	end

	def update
		@product = Product.find(params[:id])
		@product.name = params[:name]
		@product.description = params[:description]
		@product.pricing = params[:pricing]
		if @product.valid?
			@product.save
			redirect_to @product
		else
			redirect_to edit_product_path, alert: @product.errors.full_messages.each {|message| message}
		end

	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end


end
