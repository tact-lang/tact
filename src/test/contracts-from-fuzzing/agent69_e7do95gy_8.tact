contract TestHexEscape {
    receive() {
        // Test 7: Valid hex escape sequence using exactly two hex digits
        let s: String = "Value: \x41"; // Expected to produce "Value: A"
    }
}
