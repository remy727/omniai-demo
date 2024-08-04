class AskService
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def call
    ask(question)
  end

  private

  def ask(question)
    openai = OmniAI::OpenAI::Client.new
    response = openai.embed(question)
    products = Product.nearest_neighbors(response.embedding).first(3)

    openai.chat(stream: $stdout) do |prompt|
      prompt.system('You are a helpful assistant that answers a question (<question>...</question>) using the attached products (<products>...</products>).')
      prompt.user(<<~TEXT)
        <question>#{question}</question>
        <products>
          #{products.map { |product| "<product>#{product.text}</product>" }}
        </products>
      TEXT
    end
  end
end
