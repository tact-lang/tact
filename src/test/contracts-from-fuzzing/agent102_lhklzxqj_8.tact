contract TestContract {
    receive() {
        // Testing Base64 conversion from a valid Base64 string literal
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = s.fromBase64();
        dump(decoded);
    }
}
