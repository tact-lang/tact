struct Pair { first: Int; second: Int; }

trait T {
    // Abstract constant A must be overridden
    abstract const A: Int;
    // Virtual constant B can be overridden, but defaults to 10
    virtual const B: Int = 10;

    // Abstract function f must be implemented
    abstract fun f(): Int;
    // Virtual function g can be overridden, default implementation returns 42
    virtual fun g(): Int { return 42; }
}

contract C() with T {
    // Override the abstract constant A and the virtual constant B
    override const A: Int = 100;
    override const B: Int = 20;

    // Implement abstract function f
    override fun f(): Int { return self.A; }
    // Override virtual function g
    override fun g(): Int { return self.B; }

    // Getter to test the behavior: should return Pair(100,20)
    get fun test(): Pair {
        return Pair{ first: self.f(), second: self.g() };
    }
}
