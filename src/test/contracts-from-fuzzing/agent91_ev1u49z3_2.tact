contract Test {
    receive() {
        // Use a correct capitalized String type literal
        let s: String = "Hello, Tact!";
        // Convert string to slice and try to load first 8 bits, if available
        // This tests that string literal is accepted and proper conversion via asSlice()
        let _ = s.asSlice();
    }
}
