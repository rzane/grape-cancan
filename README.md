# Grape::CanCan

Use CanCan to authorize your Grape endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-cancan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-cancan

__NOTE:__ The [cancan](https://github.com/ryanb/cancan) gem by Ryan Bates is no longer maintained. If you're still using that gem, you should consider replacing it with [cancancan](https://github.com/CanCanCommunity/cancancan).

## Usage

This gem adds the __current_ability__, __can?__, __cannot?__, and __authorize!__ helper methods to all Grape API endpoints. This gem expects you to have a __current_user__ helper.

```ruby
class Users < Grape::API
  resource :users

  get '/:id' do
    @user = User.find(params[:id])
    authorize! :read, @user
    @user
  end
end
```

#### Authorizing All Routes

The __authorize_routes!__ method allows you to automatically perform authorization on all routes. Just add the `:authorize` key to the route options and call `authorize_routes!`.

Authorization will be skipped on actions that don't provide the `:authorize` route option.

```ruby
class Users < Grape::API
  resource :users
  authorize_routes!

  get '/', authorize: [:read, User] do
    User.all
  end
end
```

#### Authorizing Specific Routes

For more fine grained control, you can call __authorize_route!__ in a `before` block.

```ruby
class Users < Grape::API
  resource :users

  before do
    authorize_route! if user_signed_in?
  end

  get '/', authorize: [:read, User] do
    User.all
  end
end
```

## Contributing

1. Fork it ( https://github.com/rzane/grape-cancan/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
