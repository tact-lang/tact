contract TestContract {
    // Test 9: Using String.fromBase64 to decode a valid Base64-encoded string
    receive() {
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
        // Convert back to String (note: this roundtrip works if the underlying data is valid UTF8)
        let s2: String = sl.asString();
    }
}
