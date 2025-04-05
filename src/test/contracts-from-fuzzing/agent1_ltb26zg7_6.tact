contract TestCTSha256() {
    fun run() {
        // Test compile-time evaluation of built-in function sha256.
        // The SHA256 value is computed in compile-time if possible.
        // Dump the resulting SHA256 hash as a string.
        dump(sha256("Hello, Tact!").toString());
    }
    
    receive() {
        self.run();
    }
}
