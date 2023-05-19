class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if 
      redirect_to prototype_path
    else
    render :show
  end
  private 
  def prototype_params
    params.require(:comment).permit(:content).merge(user_id: .prototype_id)

end
