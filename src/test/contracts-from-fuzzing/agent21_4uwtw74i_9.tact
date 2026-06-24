contract Sha256ConstTest() {
    // Evaluate sha256 at compile-time using a string literal
    // This will compute the SHA256 hash of "hello world" at compile-time
    const HASH: Int = sha256("hello world");

    // Provide a getter to return the computed constant
    get fun get_hash() : Int {
        return self.HASH;
    }

    // A simple receive method to include contract usage
    receive() {
        // No operation
    }
}
