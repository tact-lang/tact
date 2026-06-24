trait MyTrait {
    // A virtual function that can be overridden
    virtual fun virtFunc(x: Int): Int {
        return x + 1;
    }
    
    // An abstract function that MUST be overridden
    abstract fun absFunc(x: Int): Int;
}

contract MyContract() with MyTrait {
    // Override the virtual function with new behavior
    override fun virtFunc(x: Int): Int {
        return x + 2;
    }
    
    // Override the abstract function as required
    override fun absFunc(x: Int): Int {
        return x * 2;
    }
    
    // A helper function to test the trait functions
    fun runTest(): Int {
        let a = self.virtFunc(3); // Expected: 3 + 2 = 5
        let b = self.absFunc(3);  // Expected: 3 * 2 = 6
        return a + b;             // Expected result: 11
    }

    // A receiver to invoke runTest so that the functions are used in the compiled contract
    receive() {
        let _ = self.runTest();
        // Forward any remaining value to the sender to ensure complete processing
        cashback(sender());
    }
}
