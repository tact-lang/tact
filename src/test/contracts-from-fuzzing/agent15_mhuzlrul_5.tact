trait TraitA {
    // Abstract function to be implemented
    abstract fun compute(): Int;
    
    // Virtual function with a default implementation
    virtual fun bar(): Int {
        return 10;
    }
    
    // Virtual constant that can be overridden; default is 2
    virtual const FACTOR: Int = 2;
    
    // Abstract constant that must be defined by the final contract
    abstract const OFFSET: Int;
    
    // A helper function using compute(), FACTOR, and OFFSET
    fun doCompute(): Int {
        return self.compute() * self.FACTOR + self.OFFSET;
    }
}

trait TraitB with TraitA {
    // Provide a default implementation for compute()
    override fun compute(): Int {
        return 5;
    }
    
    // Redeclare the abstract constant OFFSET; traits inheriting abstract constants
    // must re-declare them as abstract override
    abstract override const OFFSET: Int;
}

contract Test() with TraitB {
    // Override the abstract constant OFFSET and the virtual constant FACTOR
    override const OFFSET: Int = 3;
    override const FACTOR: Int = 4;
    
    receive() {
        let result = self.doCompute(); // Expected: 5 * 4 + 3 = 23
        require(result == 23, "Computed value must be 23");
    }
}
