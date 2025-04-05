trait A {
    fun foo(): Int { return 1; }
}

trait B {
    fun foo(): Int { return 2; }
}

contract C() with A, B {
    // Attempt to resolve the method conflict by overriding foo
    override fun foo(): Int {
        // For this test, simply return a fixed value to confirm override takes effect
        return 3;
    }

    receive() {
        dump(self.foo());
    }
}
