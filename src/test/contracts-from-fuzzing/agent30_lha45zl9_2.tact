trait TraitTest {
    // Abstract function: must be implemented by inheriting contract
    abstract fun abstractFunc(x: Int): Int;

    // Virtual function: can be overridden
    virtual fun virtualFunc(x: Int): Int {
        return x + 10;
    }

    // Abstract constant: must be overridden
    abstract const ABS_CONST: Int;

    // Virtual constant: can be overridden
    virtual const VIRT_CONST: Int = 100;
}

contract ContractTest() with TraitTest {
    // Override abstract function
    override fun abstractFunc(x: Int): Int {
        return x + 20;
    }
    
    // Override virtual function
    override fun virtualFunc(x: Int): Int {
        return x + 30;
    }
    
    // Provide implementation for abstract constant
    override const ABS_CONST: Int = 50;
    
    // Override virtual constant
    override const VIRT_CONST: Int = 200;
    
    // Receiver function to test behavior
    receive() {
        // Calling trait functions via self
        let a: Int = self.abstractFunc(0); // expected 20
        let b: Int = self.virtualFunc(0);  // expected 30
        let c: Int = self.ABS_CONST;       // expected 50
        let d: Int = self.VIRT_CONST;      // expected 200
        
        // Dump values as test outputs
        dump(a);
        dump(b);
        dump(c);
        dump(d);
        
        // Return remainder of funds
        cashback(sender());
    }
}
