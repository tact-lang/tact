contract Test {
    // Test underscore discard: receiver with underscore parameter for arbitrary text messages
    receive(_: String) {
        // No operation
    }
}
