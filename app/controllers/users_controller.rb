class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @mame = current_user.name
    @prototypes = current_user.prototypes
    @profile = current_user.profile
    @occupation = current_user.occupation
    @position = current_user.position
  end
end
