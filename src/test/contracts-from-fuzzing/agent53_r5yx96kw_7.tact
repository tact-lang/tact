contract Test {
    receive() {
        // Test: compute SHA-256 hash based on data bits of a string
        let h: Int = "abc".hashData();
    }
}
