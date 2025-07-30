trait TraitC {
    // Abstract function g must be overridden
    abstract fun g(): Int;
    // Concrete function in TraitC (uses self.g())
    fun callG_C(): Int { 
        return self.g() + 10;
    }
}

trait TraitD {
    // Concrete function g in TraitD, but it will be overridden by the contract
    fun g(): Int { 
        return 5;
    }
    // Concrete function in TraitD (using self.g())
    fun callG_D(): Int { 
        return self.g() * 2;
    }
}

contract TestContract() with TraitC, TraitD {
    // Override g() because TraitC demands it
    override fun g(): Int {
        return 42;
    }
    
    receive() {
        // Use self.callG_C() and self.callG_D()
        // Expected: callG_C returns 42 + 10 = 52
        //           callG_D returns 42 * 2 = 84
        // Sum = 136
        dump(self.callG_C() + self.callG_D());
        cashback(sender());
    }
}
