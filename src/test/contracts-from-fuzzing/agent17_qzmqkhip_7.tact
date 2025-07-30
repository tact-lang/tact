trait TestTrait {
    // Abstract function
    abstract fun abstractFunc(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun virtualFunc(x: Int): Int {
        return x + 1;
    }

    // Abstract constant: must be overridden
    abstract const abstractConst: Int;

    // Virtual constant with a default value
    virtual const virtualConst: Int = 100;
}

struct TestResult {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract TestContract(x: Int) with TestTrait {
    // In Tact, contract parameters become persistent fields, accessible as self.x

    // Override the abstract function
    override fun abstractFunc(y: Int): Int {
        return y * 2;
    }
    
    // Override the virtual function
    override fun virtualFunc(y: Int): Int {
        return y + 10;
    }
    
    // Override the abstract constant
    override const abstractConst: Int = 7;
    
    // Override the virtual constant
    override const virtualConst: Int = 200;
    
    // Test function that returns a structure with values computed via trait members
    fun test(): TestResult {
        return TestResult{
            a: self.abstractFunc(self.x),
            b: self.virtualFunc(self.x),
            c: self.abstractConst,
            d: self.virtualConst
        };
    }
    
    receive() {
        let result = self.test();
        // Instead of dumping a struct, dump the sum of its fields
        dump(result.a + result.b + result.c + result.d);
    }
}
