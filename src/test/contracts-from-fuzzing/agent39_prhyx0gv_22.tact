contract Test {
    // Test: External receiver with a parameter instead of a fixed comment - should trigger a compile error
    external(str: String) {
        // do nothing
    }
}
