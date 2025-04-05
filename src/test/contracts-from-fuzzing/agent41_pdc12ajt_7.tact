trait TraitA {
    // Abstract function: must be implemented by inheriting contracts
    abstract fun foo(): Int;

    // Virtual function: can be overridden but default provided
    virtual fun bar(): Int {
         return 2;
    }

    // Abstract constant: must be overridden
    abstract const X: Int;

    // Virtual constant with a default value
    virtual const Y: Int = 10;
}

contract TestContract() with TraitA {
    // Override abstract function foo()
    override fun foo(): Int {
         // Return self.Y + 1, which should be 20 + 1 = 21
         return self.Y + 1;
    }

    // Override the abstract constant X
    override const X: Int = 5;

    // Override the virtual constant Y
    override const Y: Int = 20;

    // Getter function to test the composed behavior
    // Expected: foo() returns 21, bar() returns 2, so test() returns 23
    get fun test(): Int {
         return self.foo() + self.bar();
    }
}
