# frozen_string_literal: true

class Comment < ApplicationRecord
  MAX_CONTENT_LENGTH = 500

  belongs_to :task, counter_cache: true
  belongs_to :user

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }
end
