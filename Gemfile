# frozen_string_literal: true

source "https://rubygems.org"

ruby file: ".ruby-version"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# Drivers
gem "pg", "~> 1.1"

# Deployment
gem "puma", ">= 5.0"

# Front-end
gem "sprockets-rails"

# Other
gem "tzinfo-data", platforms: [:windows, :jruby]
gem "dotenv-rails", "~> 3.1"
gem "omniai", "~> 1.7"
gem "omniai-openai", "~> 1.7"
gem "neighbor", "~> 0.4.0"

group :development, :test do
  gem "debug"
  gem "rubocop-shopify", require: false
end

group :development do
  gem "web-console"
end
