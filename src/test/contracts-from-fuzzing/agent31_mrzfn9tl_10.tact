contract Test {
    // Test 1: Basic string literal assignment result.
    receive() {
        let s: String = "Hello, Tact!";
        dump(s); // Expected output: "Hello, Tact!"
    }
}
