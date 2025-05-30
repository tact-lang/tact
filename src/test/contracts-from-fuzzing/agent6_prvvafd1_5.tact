trait A {
    // Abstract function
    abstract fun fa(x: Int): Int;
    // Virtual function with default implementation
    virtual fun va(x: Int): Int { return x + 1; }

    // Abstract constant
    abstract const CA: Int;
    // Virtual constant with default value
    virtual const CB: Int = 100;
}

trait B {
    // Abstract function
    abstract fun fb(y: Int): Int;
    // Virtual function with default implementation
    virtual fun vb(y: Int): Int { return y * 2; }

    // Abstract constant
    abstract const CB2: Int;
    // Virtual constant with default value
    virtual const CB3: Int = 50;
}

contract D() with A, B {
    // Override abstract functions
    override fun fa(x: Int): Int { return x - 1; }
    override fun fb(y: Int): Int { return y + 10; }

    // Override abstract constants with compile-time literals
    override const CA: Int = 42;
    override const CB2: Int = 30;

    // Optionally override virtual constant
    override const CB: Int = 200;

    receive() {
        let r1 = self.fa(5);    // Expected: 5 - 1 = 4
        let r2 = self.fb(5);    // Expected: 5 + 10 = 15
        let v1 = self.va(10);   // Expected: 10 + 1 = 11
        let v2 = self.vb(5);    // Expected: 5 * 2 = 10
        let c1 = self.CA;       // Expected: 42
        let c2 = self.CB;       // Expected: 200
        let c3 = self.CB3;      // Expected default: 50
        let c4 = self.CB2;      // Expected: 30
        cashback(sender());
    }
}
