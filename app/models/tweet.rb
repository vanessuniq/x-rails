class Tweet < ApplicationRecord
  broadcasts_refreshes

  validates :body, length: { minimum: 1, maximum: 280 }
end
