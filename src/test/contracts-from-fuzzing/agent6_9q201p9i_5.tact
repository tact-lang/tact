contract TestSha256() {
    // Constant evaluated at compile-time using the sha256 built-in function.
    // The expected behavior is that the sha256 hash is computed at compile-time.
    const sha_val: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    receive() {
        // Access the constant via self
        dump(self.sha_val);
        cashback(sender());
    }
}
