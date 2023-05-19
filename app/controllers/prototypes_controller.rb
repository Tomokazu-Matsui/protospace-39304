class  PrototypesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:edit]
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to user_session_path
    else
      render :new
  end
end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def  edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update
      redirect_to edit_prototype_path
    else
      render :edit
  end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    prototype.destroy
  end



  private 
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :edit
    end
  end


end
