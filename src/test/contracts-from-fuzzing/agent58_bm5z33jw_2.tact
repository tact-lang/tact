trait T {
    // Abstract function
    abstract fun f(x: Int): Int;
    // Virtual function with default implementation
    virtual fun g(x: Int): Int {
        return x + 1;
    }
}

contract C() with T {
    override fun f(x: Int): Int {
        return x * 2;
    }
    override fun g(x: Int): Int {
        return x + 5;
    }
    
    receive() {
        let a = self.f(3);
        let b = self.g(3);
        dump(a + b); // expected result: 6 + 8 = 14
    }
}
