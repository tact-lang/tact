contract Base64Test {
    receive() {
        // Test converting a valid Base64 string literal to a Slice
        dump("SGVyZSdzIEpvaG5ueSE=".fromBase64());
    }
}
