trait T {
    // Abstract function
    abstract fun af(): Int;
    
    // Virtual function that returns the abstract constant using self
    virtual fun vf(): Int {
        return self.constVal;
    }
    
    // Abstract constant that must be overridden
    abstract const constVal: Int;
}

contract Test() with T {
    // Override the abstract function
    override fun af(): Int {
        return 10;
    }
    
    // Override the abstract constant
    override const constVal: Int = 7;
    
    // Getter function to test behavior: expected result = 10 + 7 = 17
    get fun result(): Int {
        return self.af() + self.vf();
    }
}

// The contract should compile. When deploying and calling the getter 'result',
// the expected returned value is 17.
