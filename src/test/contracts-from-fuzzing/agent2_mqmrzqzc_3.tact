trait TraitTest {
    // Abstract function: must be overridden by inheriting contracts
    abstract fun foo(x: Int): Int;

    // Virtual function: can be overridden
    virtual fun bar(x: Int): Int {
        return x * 2;
    }

    // Concrete function provided by the trait
    fun baz(x: Int): Int {
        return x + 3;
    }
}

contract TestContract() with TraitTest {
    // Override the abstract function
    override fun foo(x: Int): Int {
        return x - 1;
    }

    // Override the virtual function bar
    override fun bar(x: Int): Int {
        return x * 3;
    }

    // A function to test the trait's functions
    fun test(): Int {
        let a = self.foo(10);    // Expected: 10 - 1 = 9
        let b = self.bar(10);    // Expected: 10 * 3 = 30 (overridden)
        let c = self.baz(10);    // Expected: 10 + 3 = 13 (inherited from TraitTest)
        return a + b + c;        // Total expected: 9 + 30 + 13 = 52
    }

    // Receive function that calls test() and dumps the result
    receive() {
        dump(self.test());
        cashback(sender());
    }
}
