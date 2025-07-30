contract TestFromBase64 {
    receive() {
        // Test valid Base64 decoding from a string
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // "Here's Johnny!"
        let slice: Slice = s.fromBase64();
    }
}
