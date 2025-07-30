contract TestExternalInvalid {
    // Test: Invalid external receiver declared with a parameter instead of a fixed string literal
    external(msg: String) {
        // This receiver should cause a compilation error because external receivers must be declared with a specific text literal.
    }
}
