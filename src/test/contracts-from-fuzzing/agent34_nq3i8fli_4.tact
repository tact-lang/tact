contract TestSHA256() {
    receive() {
        // Compute the SHA256 hash of "abc" at compile-time
        let hashValue = sha256("abc");
        // Dump the resulting value. Its expected type is Int representing the 256-bit hash.
        dump(hashValue);
    }
}
