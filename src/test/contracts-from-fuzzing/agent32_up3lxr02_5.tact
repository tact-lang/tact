trait TraitA {
    // Virtual function with a default implementation
    virtual fun f(x: Int): Int {
        return x + 10;
    }
}

trait TraitB {
    // Abstract function, must be implemented by inheriting contracts
    abstract fun f(x: Int): Int;
}

contract Combined() with TraitA, TraitB {
    // Override function to satisfy the abstract requirement from TraitB
    override fun f(x: Int): Int {
        return x * 2;
    }

    fun test(): Int {
        // Expected: test(5) returns 5 * 2 = 10
        return self.f(5);
    }

    receive() {
        dump(self.test());
    }
}
