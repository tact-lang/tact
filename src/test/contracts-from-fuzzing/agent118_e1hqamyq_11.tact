contract TestLongLiteral {
    // Test: Specific text receiver with a literal string exceeding 123 bytes
    // This receiver should produce a compilation error because the literal length exceeds 123 bytes.
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
        // body
    }
}
