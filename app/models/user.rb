class User < ApplicationRecord
  VALID_EMAIL_REGEX = [/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i].freeze

  before_save{email.downcase!}

  validates :name, presence: true, length: {maximum: Settings.NAME_MAXIMUM}
  validates :email, presence: true,
     length: {maximum: Settings.EMAIL_MAXIMUM},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: true

  has_secure_password

  validates :password, length: {minimum: Settings.PASSWORD_MINIMUM}
end
