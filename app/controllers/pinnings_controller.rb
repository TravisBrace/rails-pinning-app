class PinningsController < ApplicationController
  
  def create
    @pinning = Pinning.create(user: current_user, board_id: params[:pinning][:board_id], pin_id: params[:pinning][:pin_id])
    
    redirect_to user_path(current_user)
    
  end
end