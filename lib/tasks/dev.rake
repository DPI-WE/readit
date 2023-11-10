unless Rails.env.production?
  namespace :dev do
    desc "Drops, creates, migrates, and adds sample data to database"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Adds sample data for development environment"
    task sample_data: [
      :environment,
      "dev:add_users",
      "dev:add_posts",
      "dev:add_comments"
    ] do
      puts "done adding sample data"
    end

    task add_users: :environment do
      puts "adding users..."
      names = ["ian", "brian", "calvin", "thierry"]

      names.each do |name|
        u = User.create(
          email: "#{name}@example.com",
          username: name,
          password: "password"
        )
        puts "added #{u.email}"
      end

      puts "done"
    end

    task add_posts: :environment do
      puts "adding posts"
      25.times do |i|
        p = Post.create(
          user_id: User.all.sample.id,
          content: Faker::TvShows::DumbAndDumber.quote
        )
      end
      puts "done"
    end

    task add_comments: :environment do
      puts "adding comments"
      Post.all.each do |p|
        rand(5).times do |i|
          c = Comment.create(
            post_id: p.id,
            user_id: User.all.sample.id,
            content: Faker::Movies::HarryPotter.quote
          )
        end
      end
      puts "done"
    end
  end
end
