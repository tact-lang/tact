contract TestSha256() {
    // Compute the SHA256 of the string at compile-time
    // The expected value is the SHA256 of the given string, computed at compile-time
    const SHA: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    receive() {
        dump(self.SHA);
    }
}
