contract Test {
    // Receiver for arbitrary text messages
    receive(str: String) {
        // Using the text content in the receiver
        if (str == "test") {
            // Do something minimal
        }
    }
}
