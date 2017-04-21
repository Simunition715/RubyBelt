class User < ApplicationRecord
	has_many :ideas
	has_many :likes
	has_many :liked_ideas, through: :likes, source: :idea
  	validates :name, :alias, :email, presence: :true
  	validates :email, uniqueness: :true
  	validates :name,:alias, length: { minimum: 2 }
  	validates :password, length: { in: 6..20 }
  	has_secure_password
end
