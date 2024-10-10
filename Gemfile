source "https://rubygems.org"

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "bcrypt", "~> 3.1.7"

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "pry", "~> 0.14.2"
  gem "ostruct", "~> 0.6.0"
  gem "dotenv-rails", "~> 3.1"
  gem "faker", "~> 3.4"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
