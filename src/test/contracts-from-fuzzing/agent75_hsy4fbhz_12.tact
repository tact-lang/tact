contract Test {
    receive() {
        // Test decoding a Base64-encoded string back into its original representation
        // "SGVsbG8=" is "Hello" in Base64
        let s: String = "SGVsbG8=";
        let decoded: Slice = s.fromBase64();
        let original: String = decoded.asString();
        let eq: Bool = (original == "Hello");
    }
}
