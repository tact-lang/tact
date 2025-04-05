trait T1 {
    // A virtual constant with default value
    virtual const CONST1: Int = 5;
    
    // An abstract constant that must be provided by the inheriting contract
    abstract const CONST2: Int;
    
    // A function that uses both constants
    fun f(x: Int): Int {
         return x + self.CONST1 + self.CONST2;
    }
}

trait T2 {
    // A virtual function with default implementation
    virtual fun g(y: Int): Int {
           return y * 2;
    }
}

contract TestConst() with T1, T2 {
   // Override the virtual constant
   override const CONST1: Int = 10;
   // Provide a value for the abstract constant
   override const CONST2: Int = 15;
   
   // Override the virtual function
   override fun g(y: Int): Int {
         return y * 3;
   }
   
   // A getter function that combines the two functions
   // For input x, f(x) = x + CONST1 + CONST2, and g(x) = x*3
   // For x = 5, f(5) = 5 + 10 + 15 = 30, g(5) = 15, so result = 45
   get fun result(x: Int): Int {
         return self.f(x) + self.g(x);
   }
   
   // Receiver to execute test
   receive() {
         dump(self.result(5));
         cashback(sender());
   }
}
