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

contract Test() with A, B {
    // Explicitly override both implementations
    override fun foo(): Int {
        return 42;
    }

    receive() {
        dump(self.foo());
    }
}
