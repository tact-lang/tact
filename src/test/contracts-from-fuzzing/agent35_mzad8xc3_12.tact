contract Test {
    receive() {
        // Test valid Base64 decoding using fromBase64
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
        dump(sl);
    }
}
