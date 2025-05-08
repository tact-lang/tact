contract Test {
    receive() {
        // Test: Using fromBase64 to decode a valid Base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // Base64 for "Here's Johnny!"
        let sl: Slice = s.fromBase64();
        dump(sl.asString()); // Expected output: "Here's Johnny!"
    }
}
