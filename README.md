# Bancor
[![Gem](https://img.shields.io/gem/v/bancor.svg?style=flat-square)](https://rubygems.org/gems/bancor)
[![Build Status](https://travis-ci.org/kurotaky/bancor.svg?branch=master)](https://travis-ci.org/kurotaky/bancor)

Implement the logic of Bancor protocol.
[Bancor Protocol Decentralized networks for smart contract based tokens to enable continuous convertibility between them.](https://www.bancor.network/static/bancor_protocol_whitepaper_en.pdf)

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
### issue/destroy by reserve token
```ruby
irb(main):008:0> bp = Bancor::Protocol.new(eth: 300000, rate: 1, crr: 0.2)
=> #<Bancor::Protocol:0x00007f93039bd410 @total_supply=300000, @reserved_token=60000.0, @price=1.0, @crr=0.2>

irb(main):009:0> bp.issue_by_reserve_token 300
=> 299.40179372385245

irb(main):010:0> bp
=> #<Bancor::Protocol:0x00007f93039bd410 @total_supply=300299.40179372387, @reserved_token=60300.0, @price=1.003998003989035, @crr=0.2>

irb(main):011:0> bp.issue_by_reserve_token 700
=> 693.9974382206417

irb(main):012:0> bp
=> #<Bancor::Protocol:0x00007f93039bd410 @total_supply=300993.3992319445, @reserved_token=61000.0, @price=1.0133112579155532, @crr=0.2>

irb(main):013:0> bp.destroy_by_reserve_token 1302
=> 1307.966524590907

irb(main):014:0> bp
=> #<Bancor::Protocol:0x00007f93039bd410 @total_supply=299691.3992319445, @reserved_token=59692.033475409095, @price=0.9958916677019946, @crr=0.2>

irb(main):015:0> bp.issue_by_reserve_token 100
=> 100.34530853232869

irb(main):016:0> bp
=> #<Bancor::Protocol:0x00007f93039bd410 @total_supply=299791.7445404769, @reserved_token=59792.033475409095, @price=0.9972261505575943, @crr=0.2>
```

### issue/destroy by smart token
```ruby
irb(main):015:0> bp = Bancor::Protocol.new(eth: 300000, rate: 1, crr: 0.2)
=> #<Bancor::Protocol:0x00007fb14b0169f0 @total_supply=300000, @reserved_token=60000.0, @price=1.0, @crr=0.2>

irb(main):016:0> bp.issue_by_smart_token 50
=> 0.0

irb(main):017:0> bp
=> #<Bancor::Protocol:0x00007fb14b0169f0 @total_supply=300050, @reserved_token=60000.0, @price=0.9998333611064822, @crr=0.2>

irb(main):018:0> bp.issue_by_smart_token 100
=> 0.0

irb(main):019:0> bp
=> #<Bancor::Protocol:0x00007fb14b0169f0 @total_supply=300150, @reserved_token=60000.0, @price=0.9995002498750625, @crr=0.2>

irb(main):020:0> bp.destroy_by_smart_token 100
=> 0.0

irb(main):021:0> bp
=> #<Bancor::Protocol:0x00007fb14b0169f0 @total_supply=300050, @reserved_token=60000.0, @price=0.9998333611064822, @crr=0.2>

irb(main):022:0> bp.destroy_by_smart_token 50
=> 0.0

irb(main):023:0> bp
=> #<Bancor::Protocol:0x00007fb14b0169f0 @total_supply=300000, @reserved_token=60000.0, @price=1.0, @crr=0.2>
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
