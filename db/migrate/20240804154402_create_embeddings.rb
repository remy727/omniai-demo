# frozen_string_literal: true

class CreateEmbeddings < ActiveRecord::Migration[7.1]
  def change
    create_table(:embeddings) do |t|
      t.references(:resource, polymorphic: true, null: false)
      t.vector(:embedding, limit: 3072)

      t.timestamps
    end
  end
end
