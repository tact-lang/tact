trait MyTrait {
    // Abstract function must be overridden in the contract
    abstract fun f(): Int;
    // Virtual function with default implementation
    virtual fun g(): Int { return 100; }

    // Abstract trait-level constant
    abstract const X: Int;
    // Virtual trait-level constant with default value
    virtual const Y: Int = 200;
}

contract MyContract() with MyTrait {
    // Override the abstract function
    override fun f(): Int { return 42; }
    
    // Override the abstract constant
    override const X: Int = 55;
    // Override the virtual constant
    override const Y: Int = 300;

    // Getter function using self for all member accesses
    get fun result(): Int {
         return self.f() + self.g() + self.X + self.Y; // 42 + 100 + 55 + 300 = 497
    }

    receive() {
         cashback(sender());
    }
}
