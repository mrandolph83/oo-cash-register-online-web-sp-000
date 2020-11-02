
class CashRegister

attr_accessor :total, :discount, :items, :price, :transactions


def initialize(discount = 0)
  @total = 0
  @discount = discount
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
    while counter < quantity
      @items << item
      counter += 1
      @transactions << last_transaction
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
      return "After the discount, the total comes to $#{total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    if @total != 0
    self.total -= self.transactions[-1]
    else
      return 0.0
    end
  end


end
