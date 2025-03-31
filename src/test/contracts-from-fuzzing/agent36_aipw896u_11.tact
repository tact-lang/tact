contract Base64InvalidTest {
    receive() {
        // Test using fromBase64 on an invalid Base64 string
        let s: String = "Not_Base64!!!";
        // The following call should throw an exception at runtime (exit code 134), because the string contains invalid Base64 characters
        let decoded: Slice = s.fromBase64();
        dump(decoded);
    }
}
