class GithubProfileController < ApplicationController
  def index

  end

  def show
    user = UserApi.new(params[:username])
    @username = user.username
    @real_name = user.real_name
    @user_id = user.user_id
    @company = user.company
    @location = user.location
    @email = user.email
    @join_date = user.join_date
    @followers = user.number_of_followers
    @following = user.number_following
    @starred = user.number_starred

    @repo_name = user.repo_name
    @repo_description = user.repo_description
    @repo_language = user.repo_language
    @stargazers_count = user.repo_stargazers_count
    @forks_count = user.repo_forks_count

  end
end
