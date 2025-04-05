trait TraitA {
    // Abstract function must be overridden by contract
    abstract fun trust(x: Int): Int;
    
    // Virtual function with default implementation
    virtual fun verify(x: Int): Int {
        return x + 10;
    }
    
    // Abstract constant that must be overridden
    abstract const overrideMe: Int;
    
    // Virtual constant with a default value that can be overridden
    virtual const youCanOverrideMe: Int = 123;
}

contract MyContract() with TraitA {
    // Override the abstract function: multiply by 2
    override fun trust(x: Int): Int {
        return x * 2;
    }
    
    // Override the abstract constant
    override const overrideMe: Int = 50;
    
    // Override the virtual constant
    override const youCanOverrideMe: Int = 200;
    
    // A test function that makes use of the trait members
    fun test(): Int {
        let a = self.trust(5);      // expected: 5 * 2 = 10
        let b = self.verify(5);     // expected: 5 + 10 = 15 (using default implementation from TraitA)
        
        // Sum the results with the constants: 10 (a) + 15 (b) + 50 (overrideMe) + 200 (youCanOverrideMe) = 275
        return a + b + self.overrideMe + self.youCanOverrideMe;
    }
    
    // The receiver to trigger the test function
    receive() {
        let res = self.test();
        dump(res);
        cashback(sender());
    }
}
