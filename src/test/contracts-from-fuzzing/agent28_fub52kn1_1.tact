trait T {
    // Abstract function, must be implemented by inheriting contracts
    abstract fun f(a: Int): Int;

    // Virtual function with a default implementation
    virtual fun g(a: Int): Int {
        return a + 1;
    }
}

contract C() with T {
    // Override the abstract function f
    override fun f(a: Int): Int {
        return a * 2;
    }

    // Use the functions inside a receiver to ensure they're not optimized away
    receive() {
        // Compute the sum: f(3) should be 6, and g(3) should be 4 -> total 10
        let x = self.f(3) + self.g(3);
        // Just a dummy dump to use the computed value
        dump(x);
        return;
    }
}
