trait A {
    // Abstract function, must be overridden
    abstract fun f(): Int;
    
    // Concrete function with default implementation
    fun g(): Int { return 10; }
}

trait B {
    // Concrete implementation
    fun f(): Int { return 20; }
}

contract C() with A, B {
    // Override f to resolve the conflict and satisfy abstract requirement
    override fun f(): Int {
        return 100;
    }

    // A simple receiver calling f() and g()
    receive() {
        let sum = self.f() + self.g();
        // Expected: 100 + 10 = 110
        // Just to use the result
        dump(sum);
        cashback(sender());
    }
}
