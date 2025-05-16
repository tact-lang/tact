trait T1 {
    // Abstract function that must be implemented
    abstract fun foo(): Int;
    
    // Abstract constant that must be provided
    abstract const A: Int;
    
    // Virtual constant with a default value
    virtual const X: Int = 10;
    
    // Helper function that aggregates the values
    fun sum(): Int {
        return self.foo() + self.A + self.X;
    }
}

// Trait T2 inherits from T1 and provides default implementations for the abstract members
trait T2 with T1 {
    override fun foo(): Int { return 3; }
    override const A: Int = 7;
    override const X: Int = 20;
}

contract Combined() with T2 {
    receive() {
        // Expected: sum() = 3 + 7 + 20 = 30
        let result = self.sum();
        dump(result);
        cashback(sender());
    }
}
