contract TestFromBase64Invalid {
    receive() {
        // Test invalid base64 string: this should throw an exception at runtime with exit code 134
        let s: Slice = "InvalidBase64!".fromBase64();
    }
}
