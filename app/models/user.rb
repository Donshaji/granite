# frozen_string_literal: true

class User < ApplicationRecord
  MAX_NAME_LENGTH = 35
  MIN_PASSWORD_LENGTH = 6
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_EMAIL_LENGTH = 255

  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: MAX_EMAIL_LENGTH },
    format: { with: VALID_EMAIL_REGEX }
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: MIN_PASSWORD_LENGTH }
  validates :password_confirmation, presence: true, on: :create

  before_save :to_lowercase

  has_secure_password
  has_secure_token :authentication_token

  private

    def to_lowercase
      email.downcase!
    end
end
