class Customer
  @@cls_customer = 0
	  def initialize(id,name,surname)
	  	@cust_id = id ,
	  	@cust_name = name ,
	  	@cust_sur = surname
	         
	  end
	  def custo
	   puts "your Customers #{@cust_id}"
	  end

end

 cust1 = Customer.new("1","ankush","sharma")
 cust2 = Customer.new("2","rahul","rathod")

 cust1.custo
 cust2.custo
  
