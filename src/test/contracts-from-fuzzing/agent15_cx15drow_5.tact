trait A {
    fun foo(): Int { return 1; }
    fun bar(): Int { return self.foo(); }
}

trait B {
    fun foo(): Int { return 2; }
}

contract C() with A, B {
    // Explicitly override foo to resolve ambiguity
    override fun foo(): Int { return 10; }

    get fun test(): Int {
        return self.bar();
    }
}
