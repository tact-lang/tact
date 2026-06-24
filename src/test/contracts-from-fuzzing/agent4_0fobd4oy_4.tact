contract ExprSHA256Test {
    fun testSHA256() {
        // Compute SHA256 of a literal, computed at compile-time
        let digest: Int = sha256("test message");
        dump(digest);
    }

    receive() {
        self.testSHA256();
    }
}
