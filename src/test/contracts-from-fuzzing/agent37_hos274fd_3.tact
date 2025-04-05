trait TraitA {
    // Abstract constant and function
    abstract const a: Int;
    abstract fun funcA(): Int;
    
    // Virtual function with default behavior
    virtual fun vA(): Int {
        return self.a;
    }
}

trait TraitB {
    // Abstract constant and function
    abstract const b: Int;
    abstract fun funcB(): Int;
    
    // Virtual function with default behavior
    virtual fun vB(): Int {
        return self.b;
    }
}

// Contract inheriting both traits
contract MultiTest() with TraitA, TraitB {
    // Override abstract constants
    override const a: Int = 10;
    override const b: Int = 20;
    
    // Override abstract functions
    override fun funcA(): Int {
        return self.a + 1; // Expected: 10 + 1 = 11
    }
    
    override fun funcB(): Int {
        return self.b + 2; // Expected: 20 + 2 = 22
    }
    
    // Do not override virtual functions vA and vB, use default
    
    // A receiver to trigger the test
    receive() {
        let x = self.funcA(); // 11
        let y = self.funcB(); // 22
        let xa = self.vA();   // 10
        let yb = self.vB();   // 20
        let total = x + y + xa + yb; // 11 + 22 + 10 + 20 = 63
        dump(total);
        cashback(sender());
    }
}
