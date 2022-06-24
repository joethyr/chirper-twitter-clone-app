class Chirp < ApplicationRecord
  belongs_to :user
  validates :chirp, presence: true
end
