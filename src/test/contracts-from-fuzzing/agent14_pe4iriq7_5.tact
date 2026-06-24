trait ParentTrait {
    // Abstract function to be implemented by child traits/contract
    abstract fun compute(x: Int): Int;

    // Virtual function with default implementation
    virtual fun double(x: Int): Int {
        return x * 2;
    }
}

trait ChildTrait with ParentTrait {
    // Provide implementation for abstract function compute
    override fun compute(x: Int): Int {
        return x + 10;
    }
    
    // Override the virtual function double
    override fun double(x: Int): Int {
        // Use the compute function to get a modified value, then double it
        return self.compute(x) * 2;
    }
}

contract TestContract() with ChildTrait {
    receive() {
        let a: Int = self.compute(5); // expected to be 15
        let b: Int = self.double(5);    // expected to be 30
        // Return the sum for testing, i.e., 45
        a + b;
    }
}
