contract TestSha256 {
    // sha256 returns a compile-time computed Int for a constant string
    const HASH: Int = sha256("hello, I'll produce the SHA256 number at compile-time");
    receive() {
        require(self.HASH != 0, "sha256 constant evaluation failed");
    }
}
