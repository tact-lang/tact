trait Multiplier {
    // Abstract function: must be implemented by inheriting contracts
    abstract fun multiply(x: Int, y: Int): Int;

    // A helper function that doubles a number using multiply
    fun double(x: Int): Int {
        return self.multiply(x, 2);
    }
}

trait Adder {
    // Virtual function with a default implementation
    virtual fun add(x: Int, y: Int): Int {
        return x + y;
    }
}

contract ComplexTest() with Multiplier, Adder {
    // Override the abstract function from Multiplier
    override fun multiply(x: Int, y: Int): Int {
        return x * y;
    }

    // Using the default implementation of add from Adder
    fun test(): Int {
        // Expected: double(5) -> multiply(5, 2) = 10, add(5, 4) = 9, total = 19
        return self.double(5) + self.add(5, 4);
    }

    receive() {
        dump(self.test());
    }
}
