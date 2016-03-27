source 'https://rubygems.org'

# Specify your gem's dependencies in grape-cancan.gemspec
gemspec

case ENV['GRAPE']
when nil
  gem 'grape'
when 'HEAD'
  gem 'grape', github: 'ruby-grape/grape'
else
  gem 'grape', ENV['GRAPE']
end
