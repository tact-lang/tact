trait T {
    // Abstract function that must be implemented
    abstract fun f(x: Int): Int;

    // Abstract constant that must be overridden
    abstract const A: Int;

    // Virtual constant with a default value
    virtual const B: Int = 10;
}

contract C() with T {
    // Override abstract function
    override fun f(x: Int): Int { 
        return x * 2;
    }

    // Override abstract constant
    override const A: Int = 5;

    // Override virtual constant
    override const B: Int = 20;

    receive() {
        // Use the overridden method with self invocation
        let res = self.f(3); // Expected: 6
        // Access constants
        let a = self.A; // Expected: 5
        let b = self.B; // Expected: 20
        // For the sake of a valid contract, perform cashback
        cashback(sender());
    }
}
