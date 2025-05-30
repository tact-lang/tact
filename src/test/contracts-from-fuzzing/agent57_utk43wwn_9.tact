contract Test {
    receive() {
        // Test C: Using string.hashData to calculate SHA-256 hash
        let h: Int = "abc".hashData();
        dump(h);
    }
}
