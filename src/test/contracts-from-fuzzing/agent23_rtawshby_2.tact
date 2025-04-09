trait ConstTrait {
    // Abstract constant: must be overridden by the inheriting contract
    abstract const AB_CONST: Int;
    
    // Virtual constant: can be overridden, but has a default value
    virtual const VIRT_CONST: Int = 100;
}

contract TestConst() with ConstTrait {
    // Override the abstract constant with a concrete value
    override const AB_CONST: Int = 50;
    
    // Override the virtual constant
    override const VIRT_CONST: Int = 200;
    
    receive() {
        // Validate that the constants have the expected overridden values
        require(self.AB_CONST == 50, "abstract constant incorrect");
        require(self.VIRT_CONST == 200, "virtual constant incorrect");
        
        // End of receiver; no outbound messages needed
    }
}
