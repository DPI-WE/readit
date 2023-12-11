module Post::MetaTaggable
  extend ActiveSupport::Concern
  
  include ApplicationHelper # we need this so we can extend default meta tags

  def to_meta_tags
    post_tags = {
      title: user.username,
      description: content,
      og: {
        title: user.username,
        description: content,
        site_name: "Readit"
      },
    }

    post_tags
  end
end
