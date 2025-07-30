trait TestTrait {
    // A simple function defined in the trait
    fun add(x: Int, y: Int): Int {
         return x + y;
    }
    
    // Abstract function that must be overridden
    abstract fun absFun(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun virtFun(x: Int): Int {
         return x * 2;
    }

    // Abstract constant that must be provided by the contract
    abstract const CONST_ABS: Int;

    // Virtual constant that can be overridden
    virtual const CONST_VIRT: Int = 10;
}

contract TestContract(a: Int) with TestTrait {
    // The constructor parameter 'a' is accessible as self.a

    // Override the abstract function: returns input + constructor parameter a
    override fun absFun(x: Int): Int {
         return x + self.a;
    }

    // Override the virtual function with new behavior
    override fun virtFun(x: Int): Int {
         return x + 100;
    }

    // Override the constants
    override const CONST_ABS: Int = 5;
    override const CONST_VIRT: Int = 20;

    receive() {
         // Validate the trait functions and constants
         require(self.add(1, 2) == 3, "add should equal 3");
         require(self.absFun(10) == (10 + self.a), "absFun incorrect");
         require(self.virtFun(10) == 110, "virtFun incorrect");
         require(self.CONST_ABS == 5, "CONST_ABS incorrect");
         require(self.CONST_VIRT == 20, "CONST_VIRT incorrect");
         
         emit("traits tested".asComment());
         
         cashback(sender());
    }
}
