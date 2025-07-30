trait MyTrait {
    // Abstract constant that must be overridden
    abstract const overrideMe: Int;

    // Virtual constant that can be overridden; default is 100
    virtual const youCanOverrideMe: Int = 100;

    // Abstract function: must be implemented by inheriting contracts
    abstract fun trust(x: Int): Int;

    // Virtual function with default implementation
    virtual fun verify(x: Int): Int {
        return x + 1;
    }

    // Helper function that combines the above members
    fun combined(x: Int): Int {
         return self.trust(x) + self.verify(x) + self.overrideMe + self.youCanOverrideMe;
    }
}

// A contract that implements MyTrait
contract TestContract() with MyTrait {
    // Override abstract constant with a specific value
    override const overrideMe: Int = 50;
    // Override virtual constant with a new value
    override const youCanOverrideMe: Int = 200;

    // Provide concrete implementation for the abstract function trust
    override fun trust(x: Int): Int {
        return x * 2;
    }

    // Do not override verify; it will use the default which returns x+1

    // A message receiver to trigger the computation
    receive() {
         let r = self.combined(10);
         // Expected breakdown:
         // trust(10) = 10 * 2 = 20
         // verify(10) = 10 + 1 = 11
         // overrideMe = 50
         // youCanOverrideMe = 200
         // Total = 20 + 11 + 50 + 200 = 281
         dump(r);
    }
}

// When TestContract is deployed and its receive function is invoked,
// it should dump the value 281, confirming that abstract and virtual members
// in traits are correctly inherited and overridden in accordance with the documentation.