contract Test {
    receive() {
        // Test valid unicode escape sequence in a string literal
        let s: String = "Hello\u0041World"; // Should compile as "HelloAWorld"
    }
}
