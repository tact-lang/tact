trait T1 {
    // Abstract function f to be implemented
    abstract fun f(x: Int): Int;
}

trait T2 {
    // Another abstract function with the same signature
    abstract fun f(x: Int): Int;
}

contract C() with T1, T2 {
    // One override should satisfy both traits
    override fun f(x: Int): Int {
        return x + 1;
    }

    receive() {
        // Test that the override works by calling via self.f
        let testVal = self.f(5); // Expected: 6
        cashback(sender());
    }
}
