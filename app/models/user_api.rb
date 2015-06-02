class UserApi
  attr_reader :username

  def initialize(username)
    @username = username
    @user_hash = get_user_hash
    @repo_hash = get_repo_hash
  end

  def get_user_hash
    HTTParty.get("https://api.github.com/users/#{@username}",
      headers: {"Authorization" => "token #{ENV['GITHUB_KEY']}",
                "User-Agent" => "jmbuscemi"})
  end

  def get_repo_hash
    HTTParty.get("https://api.github.com/users/#{@username}/repos",
      headers: {"Authorization" => "token #{ENV['GITHUB_KEY']}",
                "User-Agent" => "jmbuscemi"})
  end

  def real_name
    @user_hash['name']
  end

end
