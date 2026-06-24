trait AdvancedTrait {
    // Virtual function with a default implementation
    virtual fun virtualIncrement(a: Int): Int {
        return a + self.defaultAdd;
    }
    // Abstract function that must be implemented
    abstract fun multiplyThenAdd(a: Int): Int;

    // Virtual constant, can be optionally overridden
    virtual const defaultAdd: Int = 3;
    // Abstract constant, must be overridden in the inheriting contract
    abstract const factor: Int;
}

contract TestAdvanced(x: Int) with AdvancedTrait {
    // Override the abstract function
    override fun multiplyThenAdd(a: Int): Int {
       return a * self.factor + self.defaultAdd;
    }
    // Override the abstract and virtual constants
    override const factor: Int = 4;
    override const defaultAdd: Int = 2;

    // The constructor parameter x becomes a persistent state variable, accessible as self.x
    // A receiver is required for the code to compile
    receive() {
       // Compute values using the trait methods to check overrides
       let res1 = self.virtualIncrement(self.x);        // should compute self.x + 2
       let res2 = self.multiplyThenAdd(self.x);           // should compute self.x * 4 + 2
       // Use the computed results to avoid unused variable warnings
       let _ = res1 + res2;
       cashback(sender());
    }
}
