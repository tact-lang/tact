trait MyTrait {
    // Abstract function, must be implemented by inheritors
    abstract fun t(): Int;

    // Virtual function with default implementation
    virtual fun v(): Int {
        return 42;
    }
}

contract Test() with MyTrait {
    // Implement the abstract function
    override fun t(): Int {
        return 1;
    }

    // Optionally override the virtual function
    override fun v(): Int {
        return 2;
    }

    receive() {
        // Call the trait functions to ensure they work as expected
        let a = self.t();  // should be 1
        let b = self.v();  // should be 2
        // Validate behavior via a require
        require(a + b == 3, "sum mismatch");
        cashback(sender());
    }
}
