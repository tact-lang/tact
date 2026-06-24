trait Parent {
    // Abstract function
    abstract fun abs(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun virt(x: Int): Int {
        return x + 1;
    }

    // Abstract constant: must be overridden
    abstract const CONST1: Int;

    // Virtual constant with a default value
    virtual const CONST2: Int = 42;
}

// Define a struct to hold test results
struct TestResult {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

// Contract that implements Parent trait
contract Child() with Parent {
    // Override the abstract function
    override fun abs(x: Int): Int {
        return x * 2;
    }

    // Override the virtual function
    override fun virt(x: Int): Int {
        return x + 10;
    }

    // Override the abstract constant
    override const CONST1: Int = 5;
    
    // Override the virtual constant
    override const CONST2: Int = 100;

    // Getter to test the behavior
    get fun test(): TestResult {
        return TestResult{
            a: self.abs(3),       // Expected: 3 * 2 = 6
            b: self.virt(3),      // Expected: 3 + 10 = 13
            c: self.CONST1,       // Expected: 5
            d: self.CONST2        // Expected: 100
        };
    }
}
