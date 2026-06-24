trait X {
    // Abstract function f
    abstract fun f(): Int;
    
    // Virtual function g that calls f via self
    virtual fun g(): Int {
        return self.f() + 1;
    }
}

contract C() with X {
    // Overriding f
    override fun f(): Int {
        return 100;
    }

    receive() {
        // Call g, which should use the overridden f
        let value = self.g(); // Expected value: 101
        return;
    }
}
