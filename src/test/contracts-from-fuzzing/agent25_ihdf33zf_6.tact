contract TestSha256() {
    // Compile-time evaluation of sha256: compute the hash of "abc"
    // Expected behavior: returns an Int representing the SHA256 hash of "abc".
    // The exact numeric value is not mandated here; the emphasis is on proper compile-time evaluation.
    const HASH: Int = sha256("abc");

    receive() {
        dump(self.HASH.toString());
    }
}
