trait TraitA {
    // Abstract function: must be overridden in inheriting contracts
    abstract fun foo(): Int;

    // Virtual function with a default implementation; can be overridden
    virtual fun bar(): Int {
        return 1;
    }

    // Abstract constant: must be defined by inheriting contracts
    abstract const X: Int;
    
    // Virtual constant with a default value; can be overridden
    virtual const Y: Int = 2;
}

trait TraitB {
    // A simple helper function defined in a trait
    fun baz(a: Int): Int {
        return a * 2;
    }
}

// TestContract combines both traits and overrides the abstract and virtual members.
contract TestContract() with TraitA, TraitB {
    // Override the abstract function foo to return 10
    override fun foo(): Int {
        return 10;
    }

    // Override the virtual function bar to return 11
    override fun bar(): Int {
        return 11;
    }

    // Override the virtual constant Y
    override const Y: Int = 10;
    
    // Define the abstract constant X
    override const X: Int = 110;

    // A simple receive function that calls the trait functions
    receive() {
        // Use self. to call inherited functions
        let a = self.foo();       // Expect 10
        let b = self.bar();       // Expect 11
        let c = self.baz(a);      // Expect 20
        let x = self.X;           // Expect 110
        let y = self.Y;           // Expect 10
        cashback(sender());
    }
}
