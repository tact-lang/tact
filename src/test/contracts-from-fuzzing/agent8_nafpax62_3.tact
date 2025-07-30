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

contract C() with A, B {
    override fun foo(): Int {
        // Attempt to explicitly call trait A and B implementations
        // NOTE: Using A.foo() syntax might not be allowed, so we test the resolution
        return 1 + 2; // workaround
    }

    receive() {
        let x = self.foo();
    }
}
