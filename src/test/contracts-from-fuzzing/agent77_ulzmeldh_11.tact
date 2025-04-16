contract Test {
    receive() {
        // Test the fromBase64 function with a valid Base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = s.fromBase64();
    }
}
