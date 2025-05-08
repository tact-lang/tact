contract TestSha256 {
    // Test constant evaluation of the built-in sha256 function
    // Compute the SHA256 hash of "hello" at compile-time.
    const HASH: Int = sha256("hello");

    receive() {
        dump(self.HASH);
    }
}
