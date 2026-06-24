trait MyTrait {
    // Abstract constant: must be provided by the contract
    abstract const abstractConst: Int;
    
    // Virtual constant: default value can be overridden
    virtual const virtualConst: Int = 100;

    // Abstract function: contract must implement this
    abstract fun abstractFunc(): Int;

    // Virtual function: can be overridden, default adds the constants
    virtual fun virtualFunc(): Int {
        // Using self.abstractConst and self.virtualConst
        return self.abstractConst + self.virtualConst;
    }
}

contract TestContract() with MyTrait {
    // Override abstract constant
    override const abstractConst: Int = 42;
    
    // Override virtual constant
    override const virtualConst: Int = 10;

    // Provide implementation for the abstract function
    override fun abstractFunc(): Int {
        return 5;
    }

    // Optionally override the virtual function
    override fun virtualFunc(): Int {
        // Let's choose to return twice the abstract constant (i.e., 42 * 2 = 84)
        return self.abstractConst * 2;
    }

    // A receiver to trigger the test (the function is executed on a message receipt)
    receive() {
        let res1 = self.abstractFunc(); // expected 5
        let res2 = self.virtualFunc();  // expected 84
        dump(res1);
        dump(res2);
        cashback(sender());
    }
}
