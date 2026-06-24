trait TraitConstants {
    // Abstract constant: must be overridden by the inheriting contract
    abstract const ABSTRACT_CONST: Int;
    
    // Virtual constant: can be optionally overridden. Defaults to 100.
    virtual const VIRTUAL_CONST: Int = 100;
}

contract TestContract() with TraitConstants {
    // Override the abstract constant with a concrete value
    override const ABSTRACT_CONST: Int = 50;
    
    // Override the virtual constant
    override const VIRTUAL_CONST: Int = 200;

    // A getter function to test that the constants are properly inlined
    get fun getConstantsSum(): Int {
        return self.ABSTRACT_CONST + self.VIRTUAL_CONST;
    }

    // An empty receiver to ensure the contract is fully compiled
    receive() {}
}
