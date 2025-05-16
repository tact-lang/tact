contract TestFromBase64 {
    receive() {
        // Valid Base64 encoded string
        let s: String = "SGVyZSdzIEpvaG5ueSE="; 
        let decoded: Slice = s.fromBase64();
        dump(decoded);
    }
}
