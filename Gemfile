source 'https://rubygems.org'
ruby '2.5.1'

gem 'rails', '~> 3.2.17'
gem 'active_model_serializers'

gem 'haml'
gem 'rdoc'
gem 'jquery-rails'
gem 'bcrypt'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'aws-sdk-core', '~> 2.0.0.rc1'
gem 'trollop'
gem 'opendelivery'
gem 'aws-sdk', '1.16.0'
gem 'encrypto_signo'
gem 'rugged'
gem 'test-unit'

gem 'pg'
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '2.3.1.0'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails', require: false
  gem 'fivemat'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :production do
  # Change this to use another DB in production
  gem 'sqlite3'
end
