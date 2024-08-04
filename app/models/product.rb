class Product < ApplicationRecord
  has_one :embedding, inverse_of: :resource

  validates :name, presence: true
  validates :summary, presence: true

  def text
    "#{name}: #{summary}".gsub("\n", ' ')
  end

  scope :nearest_neighbors, ->(embedding, distance: :cosine) {
    joins(:embedding)
      .merge(Embedding.nearest_neighbors(:embedding, embedding, distance:))
      .reselect(%("products".*))
  }
end
