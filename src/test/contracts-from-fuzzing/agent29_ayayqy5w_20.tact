contract Test {
    receive() {
        // Test valid usage of String.fromBase64()
        // According to documentation, this should decode the Base64 string into a Slice.
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
    }
}
