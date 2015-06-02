class GithubProfileController < ApplicationController
  def index

  end

  def show
    user = UserApi.new(params[:username])
    @username = user.username
    @real_name = user.real_name
  end
end
