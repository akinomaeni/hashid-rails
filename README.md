# Hashid Rails
[![Build Status](https://travis-ci.org/jcypret/hashid-rails.svg?branch=master)](https://travis-ci.org/jcypret/hashid-rails)
[![Code Climate](https://codeclimate.com/github/jcypret/hashid-rails/badges/gpa.svg)](https://codeclimate.com/github/jcypret/hashid-rails)
[![Test Coverage](https://codeclimate.com/github/jcypret/hashid-rails/badges/coverage.svg)](https://codeclimate.com/github/jcypret/hashid-rails/coverage)

This gem allows you to easily use [Hashids](http://hashids.org/ruby/) in your
Rails app. Instead of your models using sequential numbers like 1, 2, 3, they
will instead have unique short hashes like "yLA6m0oM", "5bAyD0LO", and
"wz3MZ49l". The database will still use integers under the hood, so this gem can
be added or removed at any time.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hashid-rails'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install hashid-rails
```

## Usage

Just use `Model#find` passing in the hashid instead of the model id:

```ruby
@person = Person.find(params[:hashid])
```

### To use only selected Models

You need to cofigure use_on_all_model to false. See the details below
Then you call `Model.hashid` in Models to use hashid

```
class Dog < ActiveRecord::Base
  hashid
end

@dog = Dog.find(params[:hashid])
```


## Configuration

To customize the Hashids seed and ensure that another user of the gem cannot
easily reverse engineer your ids, create an initializer and:

```ruby
Hashid::Rails.configure do |config|
  config.secret = 'my secret'
  config.length = 6
  # config.alphabet is optional, hashids provides a default
  # alphabet that consists of all characters [a-zA-Z0-9]
  config.alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  # use_on_all_model is optional, default is true
  # When false, call hashid method in Models to use hashid
  config.use_on_all_model = true
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git commits
and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hashid-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
