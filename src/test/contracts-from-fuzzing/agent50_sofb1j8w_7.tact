contract TestFromBase64 {
    receive() {
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let slice1: Slice = s.fromBase64();
        let slice2: Slice = s.asSlice().fromBase64();
    }
}
