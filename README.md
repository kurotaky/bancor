# Bancor
[![Gem](https://img.shields.io/gem/v/bancor.svg?style=flat-square)](https://rubygems.org/gems/bancor)

Implement the logic of Bancor protocol.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bancor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bancor

## Usage

```
irb(main):001:0> bp = Bancor::Protocol.new(eth: 300000, rate: 1, crr: 0.2)
=> #<Bancor::Protocol:0x00007fabd8a37510 @total_supply=300000, @reserved_token=60000.0, @price=1.0, @crr=0.2>

irb(main):002:0> bp.buy 300
=> 1.003998003989035

irb(main):003:0> bp.buy 700
=> 1.0133112579155532

irb(main):004:0> bp.sell 1302
=> 0.9958916677019946

irb(main):005:0> bp.buy 100
=> 0.9972261505575943

irb(main):006:0> bp.total_supply
=> 299791.7445404769

irb(main):007:0> bp.reserved_token
=> 59792.033475409095

irb(main):008:0> bp.price
=> 0.9972261505575943
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kurotaky/bancor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bancor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kurotaky/bancor/blob/master/CODE_OF_CONDUCT.md).
