contract TestFromBase64ErrorHandling {
    receive() {
        // This test uses fromBase64 on an invalid Base64 string.
        // According to the docs, the string should cause a runtime exception with exit code 134.
        try {
            let s: Slice = "NotBase64".fromBase64();
            dump(0); // Should not reach here
        } catch (e) {
            dump(e); // Expect exit code 134
        }
    }
}
