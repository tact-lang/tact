contract Test {
    receive() {
        // Testing String.fromBase64 with an invalid base64 string.
        // According to documentation, if s contains characters not from the Base64 set, an exception with exit code 134 should be thrown.
        let s: String = "not_base64";
        s.fromBase64();
    }
}
