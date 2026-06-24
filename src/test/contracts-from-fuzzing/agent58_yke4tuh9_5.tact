contract TestSHA256() {
    // Testing compile-time evaluation of the sha256 built-in function
    // The value should be computed at compile time.
    const SHA256: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    receive() {
        dump(self.SHA256);
    }
}
