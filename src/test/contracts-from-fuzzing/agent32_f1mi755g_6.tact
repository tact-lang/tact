contract TestSHA256() {
    // Test constant evaluation of the sha256 compile-time function
    // Expected: sha256("Hello, TON!") to produce a consistent hash value
    const SHA: Int = sha256("Hello, TON!");

    receive() {
        dump(self.SHA); // Dump the computed SHA256 hash as an integer
    }
}
