contract Test {
    receive() {
        // Test conversion of a valid Base64 string to Slice using fromBase64()
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = s.fromBase64();
    }
}
