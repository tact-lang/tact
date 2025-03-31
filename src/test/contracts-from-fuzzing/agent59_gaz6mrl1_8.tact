contract Test {
    // Receiver that handles arbitrary text messages but discards its parameter
    receive(_: String) {
        // Implementation does nothing
    }
}
