contract Test {
    receive() {
        // Test fromBase64: decode a base64 encoded string into a Slice
        let base64: String = "SGVyZSdzIEpvaG5ueSE=";
        let sliced: Slice = base64.fromBase64();
        dump(sliced);
    }
}
