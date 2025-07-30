contract Test {
    receive() {
        // Test String.fromBase64 using a valid Base64 string
        let base64_str: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = base64_str.fromBase64();
    }
}
