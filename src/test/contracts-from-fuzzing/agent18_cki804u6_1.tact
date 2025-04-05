trait T {
    // Abstract function
    abstract fun f(): Int;
    
    // Virtual function with a default implementation
    virtual fun g(): Int { 
        return 10;
    }
    
    // Abstract trait-level constant; must be overridden
    abstract const A: Int;
    
    // Virtual trait-level constant with a default value; can be overridden
    virtual const B: Int = 20;
}

contract TestContract() with T {
    // Override the abstract function f
    override fun f(): Int { 
        // Use the constants defined in the trait
        return self.A + self.B;
    }

    // Overriding abstract constant A
    override const A: Int = 5;
    
    // Overriding virtual constant B
    override const B: Int = 15;

    receive() {
        let res = self.f();
        // The expected outcome is 5 + 15 = 20
        dump(res);
        cashback(sender());
    }
}
