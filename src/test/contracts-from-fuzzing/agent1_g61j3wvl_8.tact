trait CalcTrait {
    // Abstract function
    abstract fun add(a: Int, b: Int): Int;

    // Virtual function with a default implementation
    virtual fun mul(a: Int, b: Int): Int {
        return a * b;
    }
}

contract CalcContract() with CalcTrait {
    // Override the abstract function
    override fun add(a: Int, b: Int): Int {
        return a + b;
    }

    // Override the virtual function:
    override fun mul(a: Int, b: Int): Int {
        return a * b + 1; // intended: a * b + 1
    }

    // Getter that uses self.calling trait methods
    get fun result(): Int {
        // Expected: add(3,4) = 7, mul(2,5) = 2*5+1 = 11, sum = 18
        return self.add(3, 4) + self.mul(2, 5);
    }

    receive() {
        cashback(sender());
    }
}
