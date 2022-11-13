class User < ApplicationRecord
  has_person_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username

  has_many :tweets
  has_one_attached :profile_image
end
