class Rssfeed < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :feedurl, presence: true
  # TODO plutot que de verifier si c'est une url, verifier si c'est un flux rss
  validates :feedurl, format: { with: URI.regexp }, if: 'feedurl.present?'
end
