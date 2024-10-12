class RoomsController < ApplicationController
  def index 
    @current_user = current_user 
    redirect_to "/signin" unless @current_user 

    @room  = Room.new
    @rooms = Room.public_rooms 
    @users = User.all_except(@current_user)
  end

  def create 
    @room = Room.create(room_params)
  end

  def show 
    @room         = Room.new 
    @rooms        = Room.public_rooms
    @message      = Message.new 
    @current_user = current_user 
    @single_room  = Room.find(params[:id])
    @messages     = @single_room.messages
    @users        = User.all_except(@current_user)

    render "index"
  end

  private 

  def room_params 
    params.require(:room).permit(:name)
  end
end
