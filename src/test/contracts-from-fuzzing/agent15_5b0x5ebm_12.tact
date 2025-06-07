contract TestSha256 {
    receive() {
        // Test compile-time evaluation of sha256 expression
        // Expected: a 256-bit integer resulting from the SHA-256 hash of "test"
        dump(sha256("test"));
    }
}
