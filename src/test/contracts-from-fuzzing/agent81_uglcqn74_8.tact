contract Test {
    // Test valid \x escape sequence
    receive() {
        let s: String = "char: \x41"; // should result in "char: A"
    }
}
