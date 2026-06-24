trait TestTrait {
    // Abstract function must be overridden
    abstract fun doSomething(): Int;
    
    // Virtual function with default implementation, can be overridden
    virtual fun doVirtual(): Int {
        return 42;
    }
    
    // Abstract constant, must be overridden
    abstract const abstractConst: Int;
    
    // Virtual constant with default value, can be overridden
    virtual const virtualConst: Int = 100;
}

contract TestContract() with TestTrait {
    // Override the abstract function
    override fun doSomething(): Int {
        return 7;
    }
    
    // Override the virtual function
    override fun doVirtual(): Int {
        return 21;
    }
    
    // Override the abstract constant
    override const abstractConst: Int = 13;
    
    // Override the virtual constant
    override const virtualConst: Int = 200;

    // Receiver to invoke the functions and dump the result
    receive() {
        let result = self.doSomething() + self.doVirtual() + self.abstractConst + self.virtualConst;
        // Expected result: 7 + 21 + 13 + 200 = 241
        dump(result);
    }
}
