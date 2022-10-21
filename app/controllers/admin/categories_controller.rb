class Admin::CategoriesController < ApplicationController

  def index 
    @categories = Category.order(id: :desc).all
  end
  
  def show
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

   if @category.save
     redirect_to [:admin, :categories], notice: 'New Category created!'
   else
     render :new
   end
 end

end
