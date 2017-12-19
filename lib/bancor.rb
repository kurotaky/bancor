require "bancor/version"

module Bancor
  class Protocol
    attr_reader :total_supply, :reserved_token, :price, :transaction_price

    def initialize(eth:, rate:, crr:)
      @total_supply = eth * rate
      @reserved_token = @total_supply * crr
      @price = @reserved_token / (@total_supply * crr)
      @crr = crr
    end

    def issue_by_reserve_token(amount)
      smart_token_amount = @total_supply * (((1 + (amount / @reserved_token)) ** @crr) - 1)
      @reserved_token = @reserved_token + amount
      @total_supply = @total_supply + smart_token_amount
      @price = @reserved_token / (@total_supply * @crr)
      smart_token_amount
    end

    def destroy_by_reserve_token(amount)
      smart_token_amount = @reserved_token * (1 - ((1 - (amount / @total_supply)) ** (1/@crr)))
      @reserved_token = @reserved_token - smart_token_amount
      @total_supply = @total_supply - amount
      @price = @reserved_token / (@total_supply * @crr)
      smart_token_amount
    end

    def issue_by_smart_token(amount)
      transaction_price = @reserved_token * ((((amount / @total_supply) + 1) ** (1/@crr)) - 1)
      @total_supply = @total_supply + amount
      @reserved_token = @reserved_token + transaction_price
      @price = @reserved_token / (@total_supply * @crr)
      transaction_price
    end

    def destroy_by_smart_token(amount)
      transaction_price = @reserved_token * (1 - ((1 - (amount / @total_supply)) ** (1/@crr)))
      @total_supply = @total_supply - amount
      @reserved_token = @reserved_token - transaction_price
      @price = @reserved_token / (@total_supply * @crr)
      transaction_price
    end
  end
end
