contract Test {
    receive() {
        // Test toFloatString() with an invalid digits parameter: 0
        // According to documentation, digits must be in the interval (0, 78), so 0 should trigger an exception at compile-time
        let s: String = (42).toFloatString(0);
    }
}
