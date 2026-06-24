contract Test {
    receive() {
        // Testing string.fromBase64 with a valid base64 string
        let s: String = "SGVyZSdzIEJhc2U2NCE=";
        let sl: Slice = s.fromBase64();
    }
}
