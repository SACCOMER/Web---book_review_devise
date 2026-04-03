class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end