trait A {
    virtual fun foo(): Int { return 1; }
}

trait B {
    abstract fun boo(): Int;
}

contract C() with A, B {
    override fun foo(): Int { return 42; }
    override fun boo(): Int { return 3; }

    receive() {
        let a = self.foo();
        let b = self.boo();
        // Compile-time only: reply function assumed to work as in docs
        // We'll use a dummy inline function since reply must be defined
        // For our purposes, we simply dump the sum
        dump(a + b);
    }
}
