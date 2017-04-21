class Idea < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :users, through: :likes
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  validates :idea, length: {minimum: 3 }
end
