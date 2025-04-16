trait TestTrait {
    // Abstract function that must be overridden
    abstract fun abstractFunc(): Int;

    // Virtual function that can be overridden
    virtual fun virtualFunc(): Int {
         return 1;
    }

    // Trait-level abstract constant that must be overridden
    abstract const X: Int;
    
    // Trait-level virtual constant that can be overridden
    virtual const Y: Int = 10;
}

struct Triple { a: Int; b: Int; c: Int; }

contract TestContract() with TestTrait {
    // Override the abstract function
    override fun abstractFunc(): Int {
         // Return the sum of the abstract constant and the virtual constant
         return self.X + self.Y;
    }
    
    // Override the virtual function
    override fun virtualFunc(): Int {
         return 20;
    }
    
    // Override the trait-level constants
    override const X: Int = 5;
    override const Y: Int = 15;
    
    // A getter to test the outputs using a struct as return type
    get fun test(): Triple {
         // Expected: abstractFunc() returns 5 + 15 = 20, virtualFunc() returns 20, X equals 5
         return Triple{ a: self.abstractFunc(), b: self.virtualFunc(), c: self.X };
    }
}
