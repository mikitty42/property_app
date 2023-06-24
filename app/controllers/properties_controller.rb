class PropertiesController < ApplicationController
  def index
      @properties = Property.all
  end

  def new
      @property = Property.new
  end
  
  def create
      @property = Property.new(property_params)
      if @property.save
          redirect_to properties_path,notice: '新規登録に成功しました'
      else
          render :new
      end
  end

  def show
      @property = Property.find(params[:id])
  end

  def edit
      @property = Property.find(params[:id])
      if @property.update(property_params)
          redirect_to properties_path,notice: '登録を編集しました'
      else
          render :edit
          
      end
  end
  
  private
  
  def property_params
      params.require(:property).permit(:property_name,:rent,:address,:age,:remarks)
  end
      
end