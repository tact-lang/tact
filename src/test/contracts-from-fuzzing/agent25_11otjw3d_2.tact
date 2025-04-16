trait MyTrait2 {
    // Abstract constant must be overridden
    abstract const MyAbstract: Int;
    // Virtual constant with default 100
    virtual const MyVirtual: Int = 100;
    
    // Virtual function that computes the sum of its argument, the abstract constant, and the virtual constant
    virtual fun compute(x: Int): Int {
        return x + self.MyAbstract + self.MyVirtual;
    }
}

contract TestContract() with MyTrait2 {
    // Override abstract and virtual constants
    override const MyAbstract: Int = 50;
    override const MyVirtual: Int = 150;
    
    // Override compute function to add an extra 10
    override fun compute(x: Int): Int {
        return x + self.MyAbstract + self.MyVirtual + 10; // expected: 10 + 50 + 150 + 10 = 220
    }
    
    receive() {
        let out = self.compute(10);
        dump(out);
    }
}
