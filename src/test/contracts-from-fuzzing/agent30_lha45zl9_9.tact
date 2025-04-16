/// This Tact snippet tests advanced trait composition with abstract and virtual constants and functions

// TraitAlpha declares an abstract constant and function, plus a virtual constant
trait TraitAlpha {
    // Abstract constant: must be overridden by inheriting trait or contract
    abstract const base: Int;
    
    // Virtual constant with a default value; can be overridden
    virtual const factor: Int = 2;
    
    // Abstract function: must be implemented by inheriting trait or contract
    abstract fun compute(x: Int): Int;
}

// TraitBeta composes TraitAlpha and provides an override for the abstract constant
// and implements the abstract function using the constants.
trait TraitBeta with TraitAlpha {
    // Override the abstract constant from TraitAlpha with a default value
    override const base: Int = 10;
    
    // Override the virtual constant to a new value
    override const factor: Int = 3;
    
    // Override and implement the abstract function compute()
    override fun compute(x: Int): Int {
        // Compute: x + (base multiplied by factor)
        return x + self.base * self.factor;
    }
}

// FinalContract inherits TraitBeta (which itself composes TraitAlpha) and uses the provided implementations
contract FinalContract() with TraitBeta {
    receive() {
        // Call compute(2): expected result = 2 + (10 * 3) = 32
        let result: Int = self.compute(2);
        dump(result); // should dump 32
        
        // Return remaining funds
        cashback(sender());
    }
}
