contract TestValidBase64 {
    receive() {
        // Test valid base64 conversion on a known string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let slice1: Slice = s.fromBase64();
        let slice2: Slice = s.asSlice().fromBase64();
        dump(slice1 == slice2);
    }
}
