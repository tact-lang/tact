trait TraitA {
    // Abstract constant: must be overridden by the contract
    abstract const CONST_A: Int;
    
    // Virtual constant: can be overridden; default is 10
    virtual const CONST_B: Int = 10;
    
    // Abstract function: must be implemented
    abstract fun process(x: Int): Int;
}

trait TraitB {
    // A helper function provided by TraitB
    fun processOverride(x: Int): Int {
        return x + 100;
    }
}

contract ContractY() with TraitA, TraitB {
    // Override the abstract constant from TraitA
    override const CONST_A: Int = 5;
    
    // Override the abstract function from TraitA using TraitB's helper
    override fun process(x: Int): Int {
        return self.processOverride(x);
    }
    
    receive() {
        let res: Int = self.process(3); // expected: 3 + 100 = 103
        dump(res);
        
        cashback(sender());
    }
}
