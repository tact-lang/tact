struct Values { a: Int; b: Int; c: Int; d: Int; }

trait MyTrait {
    // Abstract function: must be implemented by inheriting contracts
    abstract fun f(): Int;
    
    // Virtual function with a default implementation
    virtual fun g(): Int {
        return 100;
    }
    
    // Abstract constant: must be overridden
    abstract const overrideMe: Int;
    
    // Virtual constant with a default value
    virtual const virtualConst: Int = 42;
}

contract TestContract() with MyTrait {
    // Override abstract function f
    override fun f(): Int {
        return 10;
    }
    
    // Inherit default implementation of g (which returns 100)
    
    // Override the abstract constant
    override const overrideMe: Int = 20;
    
    // Override the virtual constant
    override const virtualConst: Int = 50;
    
    // Getter that returns all values to verify correct overrides
    get fun getValues(): Values {
        // Must use self.f() and self.g() when calling trait functions
        return Values{ a: self.f(), b: self.g(), c: self.overrideMe, d: self.virtualConst };
    }
    
    receive() {
        // Dummy receiver to make the contract valid
        cashback(sender());
    }
}
