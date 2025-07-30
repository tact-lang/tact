trait ConstTrait {
    // Abstract constant, must be overridden by inheritors
    abstract const c: Int;
    
    // Virtual constant with a default value
    virtual const d: Int = 5;
}

contract ConstTest() with ConstTrait {
    // Override the abstract constant
    override const c: Int = 3;
    
    // Override the virtual constant
    override const d: Int = 7;
    
    // Getter returning the sum of the constants
    get fun test(): Int {
        return self.c + self.d;
    }
}
