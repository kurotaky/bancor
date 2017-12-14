require "bancor/version"

module Bancor
  class Protocol

    attr_accessor :total_supply, :price

    ETH = 300000.freeze        # 300000(ETH)
    CRR = 0.2.freeze           # CRR = 20%
    RATE = 1.freeze            # Rate 1ETH = 1BNT

    def initialize(eth:, rate:, crr:)
      @total_supply = eth * rate
      @reserved_token = @total_supply * crr # ETH 20% to reserve. CRR = 20%
      @price = @reserved_token / (@total_supply * crr)
    end

    def buy(quantity)
      token = @total_supply * (((1 + (quantity / @reserved_token)) ** CRR) - 1)
      @reserved_token = @reserved_token + quantity
      @total_supply = @total_supply + token
      @price = @reserved_token / (@total_supply * CRR)
    end

    def sell(quantity)
      token = @reserved_token * (1 - ((1 - (quantity / @total_supply)) ** (1/CRR)))
      @reserved_token = @reserved_token - token
      @total_supply = @total_supply - quantity
      @price = @reserved_token / (@total_supply * CRR)
    end
  end
end
