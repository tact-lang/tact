trait TraitA {
    // Abstract function must be implemented by inheriting contracts
    abstract fun foo(x: Int): Int;
    
    // Virtual function may be overridden
    virtual fun bar(x: Int): Int {
        return x + 1;
    }
    
    // Abstract constant must be defined in inheriting contracts
    abstract const abstractConst: Int;
    
    // Virtual constant can be overridden, but has a default value
    virtual const virtualConst: Int = 10;
}

contract TestContract(x: Int) with TraitA {
    // Override abstract function
    override fun foo(x: Int): Int {
        return x * 2;
    }
    
    // Override virtual function
    override fun bar(x: Int): Int {
        return x + 2;
    }
    
    // Override abstract constant
    override const abstractConst: Int = 20;
    
    // Override virtual constant
    override const virtualConst: Int = 30;
    
    // A receiver function that calls the trait functions/constants
    receive() {
        let a = self.foo(5);       // expected 10, because 5 * 2
        let b = self.bar(5);       // expected 7, because 5 + 2
        let c = self.abstractConst; // expected 20
        let d = self.virtualConst; // expected 30
        // Sum is expected to be 10 + 7 + 20 + 30 = 67
        dump(a + b + c + d);
        cashback(sender());
    }
}
