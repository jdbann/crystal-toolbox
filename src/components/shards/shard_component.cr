module Shards::ShardComponent
  def render(shard : Shard, category : Category?)
    div class: "shard-details" do
      h3 do
        span shard.popularity, class: "shard-popularity"
        link shard.full_name, to: Show.with(id: shard.id)
      end
      div class: "shard-details-columns" do
        div class: "shard-details-description" do
          para "Created #{shard.repo_created_at.to_s("%-d %B %Y")}"
          em do
            para shard.description || ""
          end
        end
        div class: "shard-details-metadata" do
          category.try do |category|
            strong do
              link category.title, to: Categories::Show.with(id: category.id)
            end
          end
          ul do
            li do
              text "#{shard.stargazers_count} stars"
            end
            li do
              text "#{shard.forks_count} forks"
            end
            li do
              text "#{shard.subscribers_count} watchers"
            end
          end
        end
      end
    end
  end
end
