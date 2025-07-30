trait A {
    // Abstract function; must be overridden
    abstract fun foo(): Int;
}

trait B {
    // Concrete function providing a default implementation
    fun foo(): Int {
        return 100;
    }
}

contract D() with A, B {
    // We explicitly override foo to resolve the conflict and satisfy the abstract requirement
    override fun foo(): Int {
        return 42;
    }

    receive() {
        let x = self.foo();
        require(x == 42, "bad override");
        cashback(sender());
    }
}
