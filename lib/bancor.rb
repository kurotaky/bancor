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

    def buy(quantity)
      token = @total_supply * (((1 + (quantity / @reserved_token)) ** @crr) - 1)
      @reserved_token = @reserved_token + quantity
      @total_supply = @total_supply + token
      @price = @reserved_token / (@total_supply * @crr)
    end

    def sell(quantity)
      token = @reserved_token * (1 - ((1 - (quantity / @total_supply)) ** (1/@crr)))
      @reserved_token = @reserved_token - token
      @total_supply = @total_supply - quantity
      @price = @reserved_token / (@total_supply * @crr)
    end

    def pricing_to_buy(quantity)
      @transaction_price = @reserved_token * ((((quantity / @total_supply) + 1) ** (1/@crr)) - 1)
      @total_supply = @total_supply + quantity
      @reserved_token = @reserved_token + @transaction_price
      @price = @reserved_token / (@total_supply * @crr)
    end

    def pricing_to_sell(quantity)
      @transaction_price = @reserved_token * (1 - ((1 - (quantity / @total_supply)) ** (1/@crr)))
      @total_supply = @total_supply - quantity
      @reserved_token = @reserved_token - @transaction_price
      @price = @reserved_token / (@total_supply * @crr)
    end
  end
end
