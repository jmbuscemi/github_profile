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

  def company
    if @user_hash['company'] == ""
      "none"
    else
      @user_hash['company']
    end
  end

  def location
    if @user_hash['location'] == ""
      "none"
    else
      @user_hash['location']
    end
  end

  def user_id
    @user_hash['id']
  end

  def join_date
    @user_hash['created_at']
  end

  def number_of_followers
    followers_link = @user_hash['followers_url']
    array = HTTParty.get("#{followers_link}",
      headers: {"Authorization" => "token #{ENV['GITHUB_KEY']}",
                "User-Agent" => "jmbuscemi"})
    array.count
  end

  def number_following
    following_link = @user_hash['following_url'].split("{")[0].to_s
    array = HTTParty.get("#{following_link}",
      headers: {"Authorization" => "token #{ENV['GITHUB_KEY']}",
                "User-Agent" => "jmbuscemi"})
    array.count
  end

  def number_starred
    starred_link = @user_hash['starred_url'].split("{")[0].to_s
    array = HTTParty.get("#{starred_link}",
      headers: {"Authorization" => "token #{ENV['GITHUB_KEY']}",
                "User-Agent" => "jmbuscemi"})
    array.count
  end


end
