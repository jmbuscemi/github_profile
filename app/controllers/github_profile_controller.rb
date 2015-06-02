class GithubProfileController < ApplicationController
  def index

  end

  def show
    user = UserApi.new(params[:username])
    @username = user.username
    @real_name = user.real_name
    @user_id = user.user_id
    @join_date = user.join_date.to_date
    @followers = user.number_of_followers
    @following = user.number_following
    @starred = user.number_starred
  end
end
