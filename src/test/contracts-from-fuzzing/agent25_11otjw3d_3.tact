trait A {
    // Abstract function: must be implemented
    abstract fun f(x: Int): Int;
}

trait B with A {
    // Provide an implementation for f
    override fun f(x: Int): Int {
        return x * 2;
    }
    
    // Virtual function g with default implementation
    virtual fun g(x: Int): Int {
        return self.f(x) + 5;
    }
}

contract C() with B {
    // Override virtual function g
    override fun g(x: Int): Int {
        return self.f(x) + 10;
    }
    
    receive() {
        // Expected: g(5) = (5 * 2) + 10 = 20
        let res = self.g(5);
        dump(res);
    }
}
