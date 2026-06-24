contract TestSHA256 {
    // Compile-time evaluation of sha256 built-in function
    // Expected: The sha256 hash of the constant string "hello, Tact!" computed at compile-time
    const HASH: Int = sha256("hello, Tact!");

    get fun getHash(): Int {
        return self.HASH;
    }
}
