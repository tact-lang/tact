trait A {
    fun f(): Int { return 1; }
}

trait B {
    fun f(): Int { return 2; }
}

contract C() with A, B {
    // Explicitly override to resolve conflict
    override fun f(): Int { return 3; }
    receive() {
        dump(self.f());
    }
}
