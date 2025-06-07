trait TraitA {
    // abstract function must be overridden
    abstract fun foo(a: Int): Int;

    // concrete function provided by the trait
    fun add(a: Int, b: Int): Int {
        return a + b;
    }
}

trait TraitB {
    // virtual function with a default implementation
    virtual fun mul(a: Int, b: Int): Int {
        return a * b;
    }
}

contract TestContract() with TraitA, TraitB {
    // Override abstract function from TraitA
    override fun foo(a: Int): Int {
         return a + 10;
    }
    
    // Override virtual function from TraitB
    override fun mul(a: Int, b: Int): Int {
         return a * b + 1;
    }
    
    // Receiver to exercise inherited functions
    receive() {
        let x = self.foo(5);    // should give 15
        let y = self.add(3, 4);   // should give 7
        let z = self.mul(2, 3);   // should give 2*3+1 = 7
        require(x == 15 && y == 7 && z == 7, "Unexpected results");
        cashback(sender());
    }
}
