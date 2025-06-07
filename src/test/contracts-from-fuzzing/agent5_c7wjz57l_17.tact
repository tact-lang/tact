contract TestContract {
    receive() {
        // Test valid usage of fromBase64 extension on a string literal
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let decoded: Slice = s.fromBase64();
        // Convert slice back to string for display (assuming it decodes to a valid string)
        let s2: String = decoded.asString();
        dump(s2);
    }
}
