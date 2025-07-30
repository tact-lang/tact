contract Test {
    // Test underscore parameter usage in a text message receiver
    receive(_: String) {
        // Receiver with underscore parameter discarding the parameter
    }
}
