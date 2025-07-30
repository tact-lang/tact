trait TestTrait {
    // Abstract internal function: must be overridden in inheriting contracts
    abstract fun testFunc(x: Int): Int;

    // Virtual internal function: can be optionally overridden
    virtual fun virtualFunc(x: Int): Int {
        return x + 1;
    }

    // Abstract constant: must be provided by the contract
    abstract const abstractConst: Int;

    // Virtual constant: has a default value but can be overridden
    virtual const virtualConst: Int = 42;
}

struct Result {
    r1: Int;
    r2: Int;
    r3: Int;
    r4: Int;
}

contract TestContract() with TestTrait {
    // Override abstract function; providing concrete implementation
    override fun testFunc(x: Int): Int {
        return x * 2;
    }
    
    // Override abstract constant with a concrete value
    override const abstractConst: Int = 100;
    
    // We do not override virtualConst here, so it should retain its default value of 42

    // A getter that returns a struct Result to verify behavior
    get fun result(x: Int): Result {
        return Result{
            r1: self.testFunc(x),          // Expected: x * 2
            r2: self.virtualFunc(x),         // Expected: x + 1
            r3: self.abstractConst,          // Expected: 100
            r4: self.virtualConst            // Expected: 42
        };
    }
}
