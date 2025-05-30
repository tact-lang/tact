contract Test {
    receive() {
        // Test: Using fromBase64 on an invalid Base64 string.
        // This should trigger an exception (exit code 134) because the string contains non-Base64 characters.
        let s: String = "NotBase64!!!";
        let invalidSlice: Slice = s.fromBase64();
        dump(invalidSlice);
    }
}
