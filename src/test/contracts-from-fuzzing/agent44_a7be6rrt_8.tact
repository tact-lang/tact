contract TestFromBase64 {
    receive() {
        // Testing String.fromBase64 with a valid Base64 string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
    }
}
