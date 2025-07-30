contract TestInvalidBase64 {
    receive() {
        // Test invalid base64 input with try-catch
        try {
            let s: String = "NonBase64??";
            // This should throw an exception as the string contains invalid Base64 characters
            let sl: Slice = s.fromBase64();
            dump(0);
        } catch (err) {
            // Dump the caught exit code, expected to be 134
            dump(err);
        }
    }
}
