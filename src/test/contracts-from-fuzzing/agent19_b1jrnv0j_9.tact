contract TestSha256 {
    // Constant computed at compile time using sha256. The SHA256 function returns an Int.
    // The exact integer value is based on the SHA256 of the provided string.
    const HASH: Int = sha256("hey, I'll produce the SHA256 at compile-time");

    receive() {
        // Dump the constant; the expected output should be the compile-time computed value.
        dump(self.HASH);
        cashback(sender());
    }
}
