contract Test {
    receive() {
        // Test D: Using string.fromBase64 with a valid Base64 encoded string
        let s: String = "SGVsbG8="; // Base64 of "Hello"
        let sl: Slice = s.fromBase64();
        dump(sl.asString()); // Expected output: "Hello"
    }
}
