trait TraitA {
    // Abstract constant: must be overridden by any inheriting contract
    abstract const myVal: Int;
    
    // Virtual constant with default value, can be overridden
    virtual const overridable: Int = 111;
    
    // A simple function that returns the sum of the constants using self reference
    fun sum(): Int {
         return self.myVal + self.overridable;
    }
}

contract TestContract() with TraitA {
    // Override the abstract constant
    override const myVal: Int = 100;
    // Override the virtual constant
    override const overridable: Int = 200;
    
    // A receiver to trigger the computation; would normally be invoked by a message
    receive() {
         let result = self.sum();
         // Expecting 100 + 200 = 300
         require(result == 300, "unexpected result");
         cashback(sender());
    }
}
