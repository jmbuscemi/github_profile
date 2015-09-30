class GithubProfileController < ApplicationController
  def search

  end

  def display
    @user = UserApi.new(params[:username])
  end
end
