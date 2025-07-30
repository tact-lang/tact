contract Test {
    receive() {
        // Test compile-time ascii function with a minimal non-empty string literal
        let a: Int = ascii("a");
    }
}
