contract ConstSha {
    // Testing compile-time evaluation of sha256 built-in function
    // The sha256 of "test" should be computed at compile-time and yield a constant 256-bit integer.
    const S: Int = sha256("test");

    receive() {
        // Reference the constant to ensure it is used and compiled
        let z: Int = self.S;
        // Use z in a no-op manner
        cashback(sender());
    }
}
