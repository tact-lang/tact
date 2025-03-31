contract Test {
    receive() {
        // Test: String.hashData with a valid ASCII string (4 bytes = 32 bits, divisible by 8)
        let h: Int = "test".hashData();
        dump(h);
    }
}
