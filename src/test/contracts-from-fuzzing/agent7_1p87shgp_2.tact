trait TestTraitUnique {
    // Abstract function: must be implemented by the contract
    abstract fun foo(x: Int);
    
    // Virtual function with default implementation
    virtual fun bar(x: Int): Int {
         return x + 1;
    }
    
    // Abstract constant: must be defined by the contract
    abstract const overrideMe: Int;
    
    // Virtual constant with default value
    virtual const defaultConst: Int = 100;
}

contract Test() with TestTraitUnique {
    // Override abstract function 'foo'
    override fun foo(x: Int) {
         // Simple implementation to double the input
         let y = x * 2;
         y; // note: this function is void so result is ignored
    }

    // Override abstract constant and virtual constant
    override const overrideMe: Int = 42;
    override const defaultConst: Int = 200;
    
    // A function to test the virtual function 'bar'
    fun test() : Int {
         return self.bar(10);
    }
}
