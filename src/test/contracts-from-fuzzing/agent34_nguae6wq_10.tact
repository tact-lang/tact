contract Test {
    receive() {
        // Test Base64 conversion: valid base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let slice: Slice = s.fromBase64();
    }
}
