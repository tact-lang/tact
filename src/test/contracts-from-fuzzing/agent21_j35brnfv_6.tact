trait L1 {
    // Abstract function that must be implemented by the contract
    abstract fun f(): Int;
    
    // Abstract constant that must be provided by the contract
    abstract const A: Int;
    
    // Virtual constant with a default value
    virtual const B: Int = 100;
    
    // Helper function that aggregates the values
    fun sum(): Int {
        // Calls the abstract function and accesses the constants via self
        return self.f() + self.A + self.B;
    }
}

contract C1() with L1 {
    // Override the abstract function with a concrete implementation
    override fun f(): Int {
        return 3;
    }
    
    // Provide a concrete value for the abstract constant A
    override const A: Int = 7;
    
    // Override the virtual constant B with a new value
    override const B: Int = 50;
    
    receive() {
        // Compute the sum using the trait function; expected: 3 + 7 + 50 = 60
        let result = self.sum();
        dump(result);
        cashback(sender());
    }
}
