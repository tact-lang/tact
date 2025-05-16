contract Base64Test {
    receive() {
        // Testing String.fromBase64 and asSlice().fromBase64
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let slice1: Slice = s.fromBase64();
        let slice2: Slice = s.asSlice().fromBase64();
    }
}
