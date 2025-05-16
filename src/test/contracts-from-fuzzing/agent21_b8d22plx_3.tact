trait AbstractTrait {
    // Abstract function that must be overridden
    abstract fun compute(a: Int): Int;
    // Virtual function with default implementation
    virtual fun add(a: Int): Int {
        return a + 5;
    }
}

trait MultiplyTrait {
    fun multiply(a: Int): Int {
        return a * 2;
    }
}

contract TestContract(a: Int) with AbstractTrait, MultiplyTrait {
    // Overriding the abstract function
    override fun compute(a: Int): Int {
        return a + 10; // expected: a + 10
    }
    // Overriding the virtual function
    override fun add(a: Int): Int {
        return a + 20; // expected: a + 20
    }

    // A helper function that uses inherited methods
    fun chain(a: Int): Int {
        // Using self to call inherited methods
        return self.compute(a) + self.add(a) + self.multiply(a);
    }

    receive() {
        let res = self.chain(5);
        // Expected result: compute(5)=15, add(5)=25, multiply(5)=10, total = 15+25+10 = 50
        dump(res);
    }
}
