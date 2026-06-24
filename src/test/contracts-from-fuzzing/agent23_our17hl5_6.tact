struct TestResult {
    r1: Int;
    r2: Int;
    r3: Int;
}

trait MyTrait {
    // Abstract function: must be implemented by inheriting contract
    abstract fun abstractF(x: Int): Int;

    // Virtual function: can be overridden, default behavior provided
    virtual fun virtualF(x: Int): Int {
        return x + 1;
    }

    // Abstract constant: must be defined in the inheriting contract
    abstract const abstractC: Int;

    // Virtual constant: default value provided, can be overridden
    virtual const virtualC: Int = 100;
}

// Using contract parameters syntax (see ) for defining persistent state
contract TestContract(withValue: Int) with MyTrait {
    // Override the abstract function
    override fun abstractF(x: Int): Int {
        return x * 2;
    }

    // Provide value for the abstract constant
    override const abstractC: Int = 42;

    // Optionally override the virtual constant
    override const virtualC: Int = 200;

    // An internal function that tests the trait behavior by returning a struct
    fun test(): TestResult {
        let r1 = self.abstractF(self.withValue);
        let r2 = self.virtualF(self.withValue);
        let r3 = self.virtualC;
        return TestResult { r1: r1, r2: r2, r3: r3 };
    }

    // Internal message receiver that calls test()
    receive() {
        let _ = self.test();
        return;
    }
}
