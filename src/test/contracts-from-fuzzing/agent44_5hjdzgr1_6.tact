trait A {
    fun foo(): Int {
        return 1;
    }
}

trait B {
    fun foo(): Int {
        return 2;
    }
}

// Contract C inherits both traits and resolves the conflict by overriding foo()
contract C() with A, B {
    override fun foo(): Int {
        return 3;
    }

    get fun res(): Int {
        return self.foo();
    }
}
