class Embedding < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_neighbors :embedding, dimensions: 3072
end
