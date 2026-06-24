contract TestSha256 {
    // Test compile-time evaluation of sha256() built-in function
    // We check that the resulting hash is non-zero
    const HASH: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    receive() {
        require(self.HASH > 0, "sha256 constant evaluation failed");
        cashback(sender());
    }
}
