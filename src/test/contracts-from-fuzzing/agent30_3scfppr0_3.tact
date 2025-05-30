trait TestTrait {
    // Abstract function must be overridden in the inheriting contract
    abstract fun abstractFunc(): Int;

    // Virtual function with a default implementation
    virtual fun virtualFunc(a: Int): Int {
        return a * 2;
    }

    // Trait-level constants
    abstract const A: Int;
    virtual const B: Int = 10;
}

contract TestContract() with TestTrait {
    // Override abstract function
    override fun abstractFunc(): Int {
        return 5;
    }

    // Override the abstract constant
    override const A: Int = 3;

    // Override the virtual constant
    override const B: Int = 20;

    receive() {
        // Compute a value using the trait functions and constants
        // Expected: self.abstractFunc() = 5; self.virtualFunc(3) = 6; A = 3; B = 20
        // So total = 5 + 6 + 3 + 20 = 34
        let result = self.abstractFunc() + self.virtualFunc(3) + self.A + self.B;
        dump(result);
        cashback(sender());
    }
}
