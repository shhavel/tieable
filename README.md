# Tieable

Provides Object#tie method which acts as public_send if receives some arguments,
except if first argument is nil it returns object itself.

Method created for creating conditional method chains.

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

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/tieable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
