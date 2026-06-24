trait A {
    // An abstract internal function that must be implemented
    abstract fun getValue(): Int;
    
    // A virtual function that can be overridden; use self.getValue()
    virtual fun doubleValue(): Int { return self.getValue() * 2; }

    // Abstract trait-level constant that must be defined in inheriting contracts
    abstract const abstractConst: Int;
    
    // Virtual trait-level constant with a default value
    virtual const virtualConst: Int = 100;
}

contract C(x: Int) with A {
    // Implement the abstract function using the contract parameter x
    override fun getValue(): Int { return self.x; }
    
    // Override the abstract constant with a compile-time literal
    override const abstractConst: Int = 52;
    
    // Override the virtual constant
    override const virtualConst: Int = 200;

    // A receiver to trigger computations and state dumping
    receive() {
        dump(self.abstractConst);
        dump(self.virtualConst);
        dump(self.doubleValue());
        cashback(sender());
    }
}
