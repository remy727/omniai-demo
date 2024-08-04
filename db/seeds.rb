Product.create!(name: 'Chair', summary: 'Made of solid oak.')
Product.create!(name: 'Table', summary: 'Made of solid maple.')
Product.create!(name: 'Toaster', summary: 'The perfect companion for a loaf of bread.')
Product.create!(name: 'Microwave', summary: 'Used to heat foods.')
Product.create!(name: 'Fridge', summary: 'Used to cool foods.')

openai = OmniAI::OpenAI::Client.new

Product.all.each do |product|
  response = openai.embed(product.text)
  embedding = product.build_embedding(embedding: response.embedding)
  embedding.save!
end
