def block_yield
   puts"this is first statment"

   yield
  
   puts"this is second statment"

   yield

   puts"this is third statment"


   yield
end
  block_yield{puts"you are in the block which is written only one time"}