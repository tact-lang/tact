contract Test {
    // Attempt to declare an external receiver with an arbitrary text parameter type
    // This is invalid because external receivers must be declared with a specific text literal.
    external(msg: String) {
        // Expected to fail compilation
    }
}
