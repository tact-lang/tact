contract TestNonNullAssertion {
    fun showcase() {
        // Test non-null assertion operator (!!) on an optional:
        // Should simply return the value if not null.
        let maybe: Int? = 7;
        dump(maybe!!); // Expected output: 7
    }

    receive() {
        self.showcase();
    }
}
