require "pry"

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if valid? == true && status == "pending" && sender.balance > self.amount
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
    else
      @status = "rejected"
     return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
