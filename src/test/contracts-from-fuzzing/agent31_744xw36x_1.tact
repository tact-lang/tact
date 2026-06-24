trait TraitTest {
    // Abstract function: must be overridden
    abstract fun f(): Int;
    // Virtual function with a default implementation
    virtual fun v(): Int {
        return 100;
    }
}

contract TestContract() with TraitTest {
    // Override the abstract function f()
    override fun f(): Int {
        return 42;
    }

    // Override the virtual function v()
    override fun v(): Int {
        return self.f() + 1; // expected result: 42 + 1 = 43
    }

    receive() {
        // Call the trait functions
        let a = self.f();         // Expect: 42
        let b = self.v();         // Expect: 43
        // Verify the sum
        require(a + b == 85, "Unexpected sum");
        // Use cashback as a dummy action
        cashback(sender());
    }
}
