contract TestSha256 {
    // Using the built-in compile-time function sha256() to compute the SHA256 hash of a string.
    // The expected value should be computed at compile-time. We don't know the exact numeric value, but we assume it is constant.
    const HASH: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

    // Getter function to retrieve the hash value.
    get fun getHash(): Int {
        return self.HASH;
    }
}
