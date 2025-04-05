trait T {
    // Abstract trait-level constant
    abstract const A: Int;
    // Virtual trait-level constant with default value
    virtual const B: Int = 42;

    // Abstract function: must be defined by inheriting contracts
    abstract fun foo(): Int;

    // Virtual function: can be overridden (default returns B)
    virtual fun bar(): Int {
        return self.B;
    }
}

contract C() with T {
    // Override the abstract constant A and virtual constant B
    override const A: Int = 10;
    override const B: Int = 100;

    // Override the abstract function foo()
    override fun foo(): Int {
        return self.A;
    }

    // Override the virtual function bar()
    override fun bar(): Int {
        return self.A + self.B;  // should yield 10 + 100 = 110
    }

    receive() {
        let x = self.foo();
        let y = self.bar();
        dump(x);  // Expected output: 10
        dump(y);  // Expected output: 110
    }
}
