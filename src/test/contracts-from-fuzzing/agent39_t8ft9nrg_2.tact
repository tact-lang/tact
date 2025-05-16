trait TraitA {
    // Abstract function that must be overridden
    abstract fun f(): Int;

    // Virtual function with a default implementation
    virtual fun g(): Int {
        return 10;
    }
}

trait TraitB {
    // A concrete function provided by TraitB
    fun h(): Int {
        return 20;
    }
}

contract TestContract() with TraitA, TraitB {
    // Override the abstract function f()
    override fun f(): Int {
        return 42;
    }

    // Override the virtual function g()
    override fun g(): Int {
        return 99;
    }

    // The receive function tests the trait methods at runtime
    receive() {
        // Compute the sum of f(), g() and h()
        let sum = self.f() + self.g() + self.h(); // expected: 42 + 99 + 20 = 161
        // Verify the computed sum matches the expectation. Note: String concatenation is not allowed in Tact, so we use a single literal message.
        require(sum == 161, "Incorrect sum");
    }
}
