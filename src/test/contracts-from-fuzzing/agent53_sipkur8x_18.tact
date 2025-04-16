contract TestGetter2 {
    v: Int;

    init() {
        self.v = 0;
    }

    receive() {}

    // Getter that modifies the state variable
    // According to documentation, modifications in getters should not persist
    get fun modifyAndGet(): Int {
        self.v = self.v + 1;
        return self.v;
    }

    // Test function that calls the getter twice and sums the results
    // Expected behavior: Each call to the getter should computed independently;
    // modifications should not persist between calls, so both calls should use the original state (0),
    // resulting in 1 for each call, and the sum should be 2.
    fun testSeq(): Int {
        let a = self.modifyAndGet();  // expected 1
        let b = self.modifyAndGet();  // expected 1
        return a + b;                 // expected 2 (if modifications are ephemeral)
    }
}
