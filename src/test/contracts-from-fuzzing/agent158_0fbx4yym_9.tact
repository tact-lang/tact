contract Test {
    // Receiver for arbitrary text messages declared first
    receive(str: String) {
        // arbitrary text receiver
    }
    // Receiver for specific text comment declared later
    receive("text") {
        // specific text receiver
    }
}
