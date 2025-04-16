trait A {
    // Abstract function, must be overridden
    abstract fun f(): Int;
}

trait B with A {
    // Provide a concrete implementation of f()
    override fun f(): Int {
        return 100;
    }
}

// Use only trait B, because it already includes A
contract C() with B {
    receive() {
        cashback(sender());
    }
    
    get fun getF(): Int {
        return self.f();
    }
}
