contract TestExternalEmpty {
    // Test: External receiver with no parameters. According to documentation, external receivers should specify a message pattern.
    // This test checks if omitting the pattern results in a compilation error.
    external() {
        // Empty body
    }
}
