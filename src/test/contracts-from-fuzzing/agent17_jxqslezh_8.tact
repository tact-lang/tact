trait A {
    // Abstract function f must be implemented by inheriting traits or contracts
    abstract fun f(): Int;
}

trait B with A {
    // Provide an overriding implementation of f in an intermediate trait
    override fun f(): Int {
        return 42;
    }
}

contract C() with B {
    // Getter to expose the result of f()
    get fun test(): Int {
        return self.f();
    }
}
