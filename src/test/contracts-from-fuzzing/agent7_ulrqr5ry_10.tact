contract TestBase64Valid {
    receive() {
        // Test valid base64 conversion using String.fromBase64
        let s: String = "SGVsbG8sIFRBUU4h"; // "Hello, TACT!" in base64
        let sliceValue: Slice = s.fromBase64();
    }
}
