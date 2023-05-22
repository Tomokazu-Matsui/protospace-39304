class  PrototypesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]

  
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototypes = Prototype.new
  end

  def create
    @prototypes = Prototype.create(prototype_params)
    if @prototypes.save
      redirect_to user_session_path
    else
      render :new
  end
end

  def show
    @prototypes = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def  edit
    @prototypes = Prototype.find(params[:id])
  end

  def update
    @prototypes = Prototype.find(params[:id])
    if @prototypes.update
      redirect_to edit_prototype_path
    else
      render :edit
  end
  end

  def destroy
    @prototypes = Prototype.find(params[:id])
    prototype.destroy
  end



  private 
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
