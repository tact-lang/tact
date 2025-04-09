contract Test {
    // Receiver with underscore discard parameter for text messages
    receive(_ : String) {
        // Arbitrary text message, parameter is discarded
    }
}
