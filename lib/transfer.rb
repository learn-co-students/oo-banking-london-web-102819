class Transfer
  
  attr_reader :sender, :receiver
  attr_accessor :amount, :sender, :status
  @@all = [ ]
  def initialize (sender, receiver, amount)
    @sender = sender 
    @receiver= receiver
    @amount = amount
    @status = "pending"
    @all = [ ]
    @all<<self
  end 

  def valid? 
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
    if self.status == "pending" 
      if sender.balance < amount || sender.valid? == false
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif receiver.valid? ==false
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        sender.balance -= amount
        receiver.balance += amount 
        self.status = "complete"
      end
    end
  end 

  def reverse_transfer
    if self.status == "complete"
      sender.balance +=amount
      receiver.balance-=amount
      self.status = "reversed"
    end 
  end
end
