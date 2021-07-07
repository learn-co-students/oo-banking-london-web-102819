class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end

  def valid? 
    return true if self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid? && @amount <= @sender.balance && @status == "pending"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer 
    if @status == "complete"
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = "reversed"
    end
  end 

end
