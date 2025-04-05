trait MyBaseTrait {
    // Abstract function that must be implemented by the inheriting contract
    abstract fun compute(x: Int): Int;

    // Virtual function that uses the abstract function
    virtual fun doCompute(x: Int): Int {
        return self.compute(x) + 5;
    }
}

contract ComputeTester() with MyBaseTrait {
    // Provide the required implementation of the abstract function
    override fun compute(x: Int): Int {
        return x * 2;
    }

    // Dummy receiver to trigger the functions
    receive() {
        let result = self.doCompute(3); // Expected: (3*2) + 5 = 11
        dump(result);
        cashback(sender());
    }
}
