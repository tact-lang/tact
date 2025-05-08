trait A {
    // Abstract constant that must be overridden
    abstract const OFFSET: Int;
    
    // A function that adds a given value to OFFSET
    fun getOffsetPlus(x: Int): Int {
       return self.OFFSET + x;
    }
}

trait B with A {
    // Override the abstract constant with a default value
    override const OFFSET: Int = 7;
}

contract TestChain() with B {
    // Compute should yield OFFSET + 10, i.e. 7 + 10 = 17
    fun compute(): Int {
       return self.getOffsetPlus(10);
    }
    
    receive() {
       let res = self.compute();
       // For fuzz-testing, we simply forward the remaining value
       cashback(sender());
    }
}
