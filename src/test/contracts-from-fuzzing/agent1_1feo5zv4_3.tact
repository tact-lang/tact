trait TraitA {
    // Abstract constant
    abstract const A: Int;
    
    // Virtual constant with default value
    virtual const B: Int = 10;
    
    // Abstract function
    abstract fun f(x: Int): Int;
    
    // Virtual function with default implementation
    virtual fun g(x: Int): Int {
        return x + self.B;
    }
}

contract TestContract() with TraitA {
    // Override abstract constant
    override const A: Int = 5;
    
    // Override virtual constant
    override const B: Int = 20;
    
    // Provide implementation for abstract function f
    override fun f(x: Int): Int {
        return x * self.A;
    }
    
    // Override virtual function g for a different behavior
    override fun g(x: Int): Int {
        // Use the overridden f and add self.B
        return self.f(x) + self.B;
    }
    
    // Receiver to trigger function calls
    receive() {
        let r1 = self.f(2);    // expected: 2 * 5 = 10
        let r2 = self.g(3);    // expected: self.f(3) + 20 = 15 + 20 = 35
        dump(r1);
        dump(r2);
        cashback(sender());
    }
}
