class Shard < BaseModel
  table :shards do
    column name : String
    column full_name : String
    column html_url : String
    column description : String?
    column forks_count : Int32
    column stargazers_count : Int32
    column subscribers_count : Int32 # GH api name for watchers
    column repo_created_at : Time
    belongs_to category : Category?
  end

  def popularity
    forks_count + stargazers_count + subscribers_count
  end
end
