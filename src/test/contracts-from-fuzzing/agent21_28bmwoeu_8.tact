contract Test {
    // Test underscore usage to discard receiver parameter
    receive(_: String) {
        // Handler that intentionally discards the string parameter
    }
}
