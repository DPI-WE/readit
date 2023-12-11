module ApplicationHelper
  def default_meta_tags
    {
      site: "Readit",
      image: image_url('book.jpeg'),
      description: "The best app for posting about stuff",
      og: {
        title: "Readit",
        image: image_url('book.jpeg'),
        description: "The best app for posting about stuff",
        site_name: "Readit"
      }
      # TODO: add twitter tags
    }
  end
end
