trait T1 {
    // Abstract constant must be implemented by the inheriting contract
    abstract const a: Int;

    // Function that uses the abstract constant
    fun f(): Int {
        return self.a + 2;
    }
}

trait T2 {
    // A simple concrete function
    fun g(): Int {
        return 10;
    }
}

contract TestC() with T1, T2 {
    // Provide concrete implementation for the abstract constant
    override const a: Int = 5;

    // Test function that aggregates outputs from f and g
    fun testC() {
        // Expected: f() = 5 + 2 = 7, and g() = 10, so total r = 17
        let r = self.f() + self.g();
        dump(r); // should dump 17
    }

    receive() {
        self.testC();
        cashback(sender());
    }
}
