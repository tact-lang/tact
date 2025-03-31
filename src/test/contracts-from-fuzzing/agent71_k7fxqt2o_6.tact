contract Test {
    // Receiver with underscore to discard parameter
    receive(_ : Slice) {
        // This receiver discards the incoming message
    }
}
