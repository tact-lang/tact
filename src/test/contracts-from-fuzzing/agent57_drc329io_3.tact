trait TraitA {
    // Abstract trait-level constant, must be overridden
    abstract const foo: Int;
    
    // Virtual trait-level constant with a default value
    virtual const bar: Int = 10;
    
    // Function to dump the constants
    fun dumpConstants() {
        dump(self.foo);
        dump(self.bar);
    }
}

contract ContractA() with TraitA {
    // Override abstract constant
    override const foo: Int = 20;
    
    // Override virtual constant
    override const bar: Int = 30;
    
    // Receiver that dumps the constants
    receive() {
        self.dumpConstants();
        cashback(sender());
    }
}
