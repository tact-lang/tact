contract TestReceiverSpecific {
    // Receives messages with comment "hello"
    receive("hello") {
        // Handler for specific text message
    }
}
