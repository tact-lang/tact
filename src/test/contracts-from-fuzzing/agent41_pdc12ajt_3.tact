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
         // Use the overridden virtual constant Y from this contract
         return self.Y + 1;
    }

    // Override the abstract constant X
    override const X: Int = 5;

    // Override the virtual constant Y
    override const Y: Int = 20;

    // A getter function to test the behavior
    get fun test(): Int {
         // self.foo() returns self.Y + 1, which should be 21
         // self.bar() from TraitA returns 2
         // So the sum should be 23
         return self.foo() + self.bar();
    }
}
