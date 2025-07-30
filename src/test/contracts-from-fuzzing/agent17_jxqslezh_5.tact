trait TConst {
    // Base constant defined in the trait
    const base: Int = 100;
    
    // Abstract constant that must be overridden by the inheriting contract
    abstract const abstractVal: Int;
    
    // Virtual constant with a default value that can be overridden
    virtual const virtualVal: Int = 200;
}

contract TestConstContract() with TConst {
    // Override the abstract constant with a literal constant
    override const abstractVal: Int = 300;
    
    // Override the virtual constant with a new literal constant
    override const virtualVal: Int = 350;
    
    // Getter functions to allow off-chain inspection of constants
    get fun testBase(): Int {
        return self.base;
    }
    
    get fun testAbstract(): Int {
        return self.abstractVal;
    }
    
    get fun testVirtual(): Int {
        return self.virtualVal;
    }
}
