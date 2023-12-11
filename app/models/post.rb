# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  flagged    :boolean          default(FALSE)
#  link       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
  include MetaTaggable

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many :comments, class_name: "Comment", foreign_key: "post_id", dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [
      "content"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    [
      "user"
    ]
  end

  def to_s
    "#{user.username}: #{content.truncate(25)}"
  end

  def to_param
    "#{id}-#{content.truncate(50).parameterize}"
  end
end
