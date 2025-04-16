contract Test {
    receive() {
        // Test valid string and Base64 decoding using fromBase64
        let s: String = "SGVyZSdzIEpvaG5ueSE=";  // Base64 string: "Here's Johnny!"
        let sl: Slice = s.fromBase64();
    }
}
