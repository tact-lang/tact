contract TestSha256() {
    // Test compile-time evaluation of the sha256() built-in function
    // It should produce a 257-bit signed integer computed from the SHA256 hash of the input string.
    // We'll dump the computed constant for verification purposes.
    const H: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    receive() {
        dump(self.H);
    }
}
