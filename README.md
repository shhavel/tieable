# Tieable

Provides Object#tie method which acts as public_send if receives some arguments,
except if first argument is nil it returns object itself.

Method is intended for creating conditional method chains.

Also can be used with block only (and no arguments).
In this case method returns result of block call (whith self as block argument) or self (if block returns nil or false).

## Installation

Add this line to your application's Gemfile:

    gem 'tieable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tieable

## Usage

Can be used as public_send, but if receives nil returns self object.
This provides the  ability to create optional method chain links.

```rb
# Optional method call
do_upcase? ? "hello world!" : "hello world!".upcase

# Optional method call with tie (note two pairs of parentheses)
"hello world!".tie((:upcase if do_upcase?))

```

This is more usefull if needed one optional method in chain

```rb
# Normally you would do
def my_method(do_upcase)
  s = "test".reverse.next.concat("45")
  s = s.upcase if do_upcase
  s
end

# Whit tie it is simpler
def my_method(do_upcase)
  "test".reverse.next.concat("45").tie((:upcase if do_upcase))
end

# Or same with block
def my_method(do_upcase)
  "test".reverse.next.concat("45").tie {|s| s.upcase if do_upcase }
end

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/tieable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
