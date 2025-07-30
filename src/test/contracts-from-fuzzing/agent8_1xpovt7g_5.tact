contract TestSha256() {
    // Test constant evaluation for the compile-time function sha256
    // We check that the hash value is non-zero as a simple verification
    const S: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    receive() {
        require(self.S != 0, "sha256 constant is zero");
        cashback(sender());
    }
}
