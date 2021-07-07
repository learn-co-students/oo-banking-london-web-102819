class Transfer

  attr_reader :receiver, :sender, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end 

  def valid?
    return @sender.valid? == true && receiver.valid? == true 
  
  end 
    
  def execute_transaction 
    if valid? == true && sender.balance >= @amount && @status=="pending"
      @status = "pending"
      receiver.balance += @amount 
      sender.balance -= @amount
      @status = "complete"
      
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      

    end 

  end 

  def reverse_transfer
    if @status == "pending"
      @receiver.balance 
      @sender.balance 
    elsif @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end 


  end 
  
  

end
