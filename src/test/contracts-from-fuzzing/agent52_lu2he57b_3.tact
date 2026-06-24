trait A {
    // An abstract function must be overridden by the contract
    abstract fun f(): Int;

    // A virtual function has a default implementation, but can be overridden
    virtual fun g(): Int {
         return 10;
    }

    // An abstract constant (must be overridden)
    abstract const X: Int;

    // A virtual constant with default value that can be optionally overridden
    virtual const Y: Int = 20;
}

contract B() with A {
    // Override the abstract function
    override fun f(): Int {
         return 42;
    }
    
    // Override the abstract constant, and override the virtual constant
    override const X: Int = 100;
    override const Y: Int = 30;
    
    // A test function to combine the trait members using instance access
    fun test(): Int {
         // Expected result: self.f() + self.g() + self.X + self.Y = 42 + 10 + 100 + 30 = 182
         return self.f() + self.g() + self.X + self.Y;
    }
    
    // A receiver to ensure the function is used in the contract
    receive() {
         // Call test() properly using self because it's an instance method
         let _ = self.test();
         cashback(sender());
    }
}
