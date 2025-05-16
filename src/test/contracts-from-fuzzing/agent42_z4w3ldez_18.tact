trait A {
    // Abstract function f to be overridden
    abstract fun f(): Int;

    // Virtual function g that calls f()
    virtual fun g(): Int {
        return self.f() + 1;
    }
}

contract C() with A {
    // Override f to return 10
    override fun f(): Int {
        return 10;
    }

    receive() {
        // Expected output: 11
        dump(self.g());
        cashback(sender());
    }
}
