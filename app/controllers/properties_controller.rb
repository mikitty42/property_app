class PropertiesController < ApplicationController
  def index
      @properties = Property.all
  end

  def new
      @property = Property.new
      2.times {@property.nearest_stations.build}
  end
  
  def create
      @property = Property.new(property_params)
      if @property.save
          redirect_to properties_path,notice: '物件の登録に成功しました'
      else
          render :new
      end
  end

  def show
      @property = Property.find(params[:id])
  end
  
  def edit
      @property = Property.find(params[:id])
      1.times {@property.nearest_stations.build}
  end

  def update
      @property = Property.find(params[:id])
      if @property.update(property_params)
          redirect_to properties_path,notice: '登録を編集しました'
      else
          render :edit
      end
  end
  
  def destroy
      @property = Property.find(params[:id])
      @property.destroy
      redirect_to properties_path,notice: '物件を削除しました'
  end
  
  private
  
  def property_params
      params.require(:property).permit(:property_name,:rent,:address,:age,:remarks,nearest_stations_attributes: [:route_name,:station_name,:walking_minutes])
  end
      
end
