contract Test {
    // This contract tests the acceptance of a basic string literal using 'let'.
    receive() {
        let s: String = "Hello, Tact!";
        // Doing a no-op with the string to force compilation of its usage.
        s;
    }
}
