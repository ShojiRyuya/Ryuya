class Post < ApplicationRecord
  #tweetsテーブルから中間テーブルに対する関連付け
  has_many :post_tag_relations, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  mount_uploader :image, ImageUploader

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
end
