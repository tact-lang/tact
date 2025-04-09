trait MyTrait {
    // Abstract function that must be overridden
    abstract fun foo(): Int;
    
    // Virtual function: default implementation returns 10
    virtual fun bar(): Int {
        return 10;
    }
    
    // A trait-level constant that is fixed
    const BASE_CONST: Int = 100;
    
    // Abstract constant: contract must override this
    abstract const ABS_CONST: Int;
    
    // Virtual constant: can be overridden, default is 200
    virtual const VIRT_CONST: Int = 200;
}

contract TestContract() with MyTrait {
    // Override abstract function
    override fun foo(): Int {
        return 42;
    }

    // Inherit bar unchanged, which should return 10

    // Must override the abstract constant
    override const ABS_CONST: Int = 7;
    
    // Override the virtual constant
    override const VIRT_CONST: Int = 300;

    receive() {
        // Validate the behavior from trait and overrides
        require(self.foo() == 42, "foo error");
        require(self.bar() == 10, "bar error");
        require(self.ABS_CONST == 7, "ABS_CONST error");
        require(self.VIRT_CONST == 300, "VIRT_CONST error");
        require(self.BASE_CONST == 100, "BASE_CONST error");
        cashback(sender());
    }
}
