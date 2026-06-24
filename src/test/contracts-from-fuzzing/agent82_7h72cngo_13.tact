contract TestStringFromBase64 {
    receive() {
        // Test base64 decoding on a valid base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
        // Convert the slice back to string, note: asString() expects the slice to represent valid string data
        let s2: String = sl.asString();
        let _cmp: Bool = s2 != "";
    }
}
