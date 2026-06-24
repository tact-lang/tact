contract TestBase64Valid {
    receive() {
        // Test decoding a valid Base64 string. The string "SGVsbG8=" decodes to "Hello".
        let s: String = "SGVsbG8=";
        let sl: Slice = s.fromBase64();
        let s2: String = sl.asString();
        s2;
    }
}
