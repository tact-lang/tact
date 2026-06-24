contract TestExternalInvalidParam {
    // Test: External receiver with an arbitrary text parameter should produce a compilation error
    // External receivers are expected only to be declared with a literal string message pattern
    external(str: String) {
        // body
    }
}
