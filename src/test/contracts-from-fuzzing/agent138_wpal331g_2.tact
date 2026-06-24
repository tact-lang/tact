contract TestReceiverLiteral {
    // This contract handles messages with a specific text literal "hello"
    receive("hello") {
        // handle literal message
    }
}
