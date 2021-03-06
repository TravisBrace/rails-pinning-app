class PinsController < ApplicationController
  before_action :require_login, except: [:index, :show, :show_by_name]
  
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
    
  end
  
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    @users = Pin.find_by_slug(params[:slug]).users
    @pinning = current_user.pinnings.build
    render :show
  end
  
  def new
    @pin = Pin.new
    
  end
  
  def create
    @pin = Pin.create(pin_params)
    
    if @pin.valid?
      @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :new
    end
    
  end
  
  def edit
    @pin = Pin.find(params[:id])
  end
  
  def update
    @pin = Pin.find(params[:id])
    
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def repin
    @pin = Pin.find(params[:id])
    @pin.pinnings.create(user: current_user)
    redirect_to user_path(current_user)
  end
  
  private
  
  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :resource_type, :category_id, :image, :user_id, pinnings_attributes: [:user_id, :board_id])
  end
  
end