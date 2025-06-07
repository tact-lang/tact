contract TestContract {
    receive() {
        // Test valid Base64 conversion using String.fromBase64
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
    }
}
