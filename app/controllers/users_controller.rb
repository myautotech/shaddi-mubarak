class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
