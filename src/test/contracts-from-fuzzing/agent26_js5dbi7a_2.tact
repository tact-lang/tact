trait TraitA {
    // Virtual function with a default implementation
    virtual fun f(): Int {
        return 1;
    }

    // Abstract function that must be overridden
    abstract fun g(): Int;
}

contract TestContract() with TraitA {
    // Override the abstract function
    override fun g(): Int {
        return 41;
    }

    // Function that tests trait functions
    fun test(): Int {
        return self.f() + self.g(); // should be 1 + 41 = 42
    }

    // Receiver to trigger the test
    receive() {
        dump(self.test());
    }
}
