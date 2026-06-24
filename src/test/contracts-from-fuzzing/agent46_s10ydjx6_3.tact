contract Test {
    // Receiver for arbitrary text messages with underscore to discard the parameter
    receive(_ : String) {
        // intentionally ignoring the input
    }
}
