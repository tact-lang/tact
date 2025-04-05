trait TestTrait {
    // Abstract function that must be overridden in any contract implementing the trait
    abstract fun absFun(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun virtFun(x: Int): Int {
        return x * 2;
    }
}

contract TestContract() with TestTrait {
    // Override the abstract function
    override fun absFun(x: Int): Int {
        return x + 1;
    }
    // Override the virtual function with a new behavior
    override fun virtFun(x: Int): Int {
        return x * 3;
    }

    // A receiver to trigger function calls
    receive() {
        // Call the overridden functions and dump their results
        let a = self.absFun(5);    // Expected: 6
        let b = self.virtFun(5);     // Expected: 15
        dump(a);
        dump(b);
        cashback(sender());
    }
}
