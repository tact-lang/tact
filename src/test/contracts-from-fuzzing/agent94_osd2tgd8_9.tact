contract TestBase64 {
    // This contract tests the usage of fromBase64 extension on strings.
    receive() {
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // valid Base64
        let sliceVal: Slice = s.fromBase64();
        sliceVal;
    }
}
