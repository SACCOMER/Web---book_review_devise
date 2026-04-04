class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :reviews, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  before_create :generate_auth_token

  def generate_auth_token
    self.auth_token = loop do
      token = SecureRandom.hex(20)
      break token unless User.exists?(auth_token: token)
    end
  end

  def reset_auth_token!
    update!(auth_token: SecureRandom.hex(20))
  end
end