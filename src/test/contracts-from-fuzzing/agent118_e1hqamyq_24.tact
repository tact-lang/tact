contract TestExactLiteral {
    // Test: Specific text receiver with a literal string of exactly 123 bytes
    // Construct a string of 123 'a' characters:
    // 10*12 + 3 = 123
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
        // body
    }
}
