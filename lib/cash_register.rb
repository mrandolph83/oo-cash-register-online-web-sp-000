
class CashRegister

attr_accessor :total, :discount, :items, :price, :transactions

# We're going to create an Object Oriented Cash Register that can:
# * Add items of varying quantities and prices
# * Calculate discounts
# * Keep track of what's been added to it
# * Void the last transaction

def initialize(discount = 0)
  @total = 0
  @discount = discount
  # Takes into account a discount that might be applied later
  @price = []
  @items = []
  @transactions = []
end

  def add_item(item, price, quantity = 1)
    @price = price
    @total += price * quantity
    last_transaction = price * quantity
    if quantity > 1
    counter = 0
# Using the counter allows you to add items based on quantity.
    while counter < quantity
      @items << item
      counter += 1
      @transactions << last_transaction
# This leads into the void_last_transaction
    end
  else
    @items << item
    @transactions << last_transaction
  end
end

  def apply_discount
    if @discount > 0
      @take_off = (price * discount)/100
      @total -= @take_off
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    if @total != 0
    self.total -= self.transactions[-1]
    # Takes off the last transaction made, set up above.
    else
      return 0.0
  # Returns 0.0 if there are no more transactions to take out
  # of the transactions array [] above
    end
  end
end
