contract TestAmbiguous {
    // Receiver for specific literal text message "test"
    receive("test") {
        // Handle literal messages with text "test"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle any text message
    }
}
