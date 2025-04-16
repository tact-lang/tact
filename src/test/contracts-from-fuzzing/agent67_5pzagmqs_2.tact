trait A {
    // Abstract function: must be implemented by inheriting contracts
    abstract fun f(): Int;
    
    // Virtual function: can be overridden, default implementation provided
    virtual fun g(): Int {
        return 1;
    }
    
    // Abstract constant: must be overridden
    abstract const constAbs: Int;
    
    // Virtual constant: can be overridden, default value provided
    virtual const constVir: Int = 2;
}

contract B() with A {
    // Override the abstract function f()
    override fun f(): Int {
        return 10;
    }
    
    // Override the virtual function g()
    override fun g(): Int {
        return 20;
    }
    
    // Override the abstract constant
    override const constAbs: Int = 100;
    
    // Override the virtual constant
    override const constVir: Int = 200;
    
    // A test function that dumps the sum of values from trait A
    fun test() {
        // Expected: 10 (f) + 20 (g) + 100 (constAbs) + 200 (constVir) = 330
        let sum = self.f() + self.g() + self.constAbs + self.constVir;
        dump(sum);
    }
    
    // The receiver triggers the test invocation
    receive() {
        self.test();
        cashback(sender());
    }
}
