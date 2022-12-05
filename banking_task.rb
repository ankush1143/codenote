class Bank
  $i = "0"
  $num = ""
  $detail = {}
  while $num != $i
    puts "Enter name of customer"
    name = gets.chomp

    puts "Enter pin to secure account"
    pin = gets.chomp.to_i
    
    puts "Enter amount you want  to diposit"
    x = gets.chomp.to_i

    $balance = x 
    id = "#{$detail.length}_#{name}"
    $detail[id] = {"name": name, "pin": pin, "balance": x}
    puts "Hello #{name} . your account balance is #{$balance}. for further process please follow the instruction line below"
    puts "press 0 for exit and press any key to continue"
    $num = gets.chomp
  end
   def banking
   	$detail.each do |key , value|
   		puts "ID = #{key}. Name = #{value[:name]}. Balance = #{value[:balance]} . pin = #{value[:pin]} "
   	end
   
   	puts "enter your correct id"
   	@id = gets.chomp

   	puts "enter your  correct pin"
   	@pin = gets.chomp.to_i
    validate
   end
    
   def validate
    $detail.map do |key,value|
      if (key != @id and value[:pin] != @pin)
        puts "account holder doesent exist"
      end
    end
        option
   end

    def option      
    	$detail.map do |key,value|
    		if (key==@id and value[:pin] == @pin)
    			puts "input d: for deposit money ,input s: for showing balance ,input w: for withdraw money ,input t: for transfer the money "
    			task = gets.chomp
    			case task
    			when "d"
    				deposit
    			when "s"
    				show_balance
    			when "w"
    				withdraw
    			when "t"
    				transfer
    			else
    				puts "try again"
    			end	
    		end
    	end
    end

  def amount
    puts "Enter  amount"
    @money = gets.to_i
  end
  def deposit
    $detail.map do |key, value|
      if (key == @id and value[:pin] ==  @pin)
        value[:balance] += amount
        puts "Deposited: #{@money}. Updated balance: #{value[:balance]}."
      end
    end
  end

  def show_balance
    $detail.map do |key, value|
      if (key == @id and value[:pin] ==  @pin)
        puts "#{value[:name]}_Balance: #{value[:balance]}."
      end
    end
  end

  def withdraw

       $detail.map do |key,value|
       if (key==@id and value[:pin] == @pin) && $balance >= amount
          value[:balance] -= amount
          puts"#{value[:name]} your old balance is : #{$balance} updated balance is : #{value[:balance]}"
        else
          puts"you dont have enough balance to withdraw"
         
        end
      end
  end
  def transfer
      $detail.map do |key, value|
        if (key == @id and value[:pin] == @pin)
          puts " please enter recivers id "
          @receiver = gets.chomp
          @receiver_acc = $detail.find{|key, value| key if key == @receiver}.last
          if amount <= value[:balance]
            value[:balance] -= @money
            @receiver_acc[:balance] += @money
            puts "transferred : #{@money} rupees  to #{@receiver_acc[:name]} updated balance of reciver is #{@receiver_acc[:balance]}.... updated balance of sender #{value[:name]} is #{value[:balance]}"
            else
              puts "you dont have that much money your balance is #{value[:balance]}"
          end
        end
      end 
  end

end
checking_account = Bank.new()
checking_account.banking
 