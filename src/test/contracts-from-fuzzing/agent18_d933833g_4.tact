contract TestSha256() {
    // This contract tests the compile-time evaluation of sha256 on a literal string.
    // The sha256 function is expected to compute the SHA256 hash of the given string at compile time.
    // We simply return the computed hash as an Int.
    
    get fun test(): Int {
         return sha256("test");
    }
}
