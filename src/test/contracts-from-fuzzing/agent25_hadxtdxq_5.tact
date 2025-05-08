trait T1 {
    // Abstract function: must be implemented by inheriting contract
    abstract fun compute(): Int;

    // Virtual function with a default implementation
    virtual fun add(x: Int): Int {
        return x + 10;
    }

    // Abstract constant: must be overridden by inheriting contract
    abstract const constA: Int;

    // Virtual constant with a default value; can be overridden
    virtual const constV: Int = 20;
}

// Contract that implements the abstract members from trait T1 directly
contract TestContract() with T1 {
    // Override the abstract function 'compute'
    override fun compute(): Int {
        return self.constA + self.constV; // Expected: 15 + 25 = 40
    }

    // Override the abstract constant
    override const constA: Int = 15;

    // Optionally override the virtual constant
    override const constV: Int = 25;

    // The receive function calls 'compute' and 'add' and dumps their results
    receive() {
        let result = self.compute(); // Expected: 40
        let sum = self.add(5);       // Expected: 5 + 10 = 15
        dump(result);
        dump(sum);
    }
}
