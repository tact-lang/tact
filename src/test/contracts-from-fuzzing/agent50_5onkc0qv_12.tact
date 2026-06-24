contract Test {
    // Receiver with literal comment "hello"
    receive("hello") {
        // handles messages with literal "hello"
    }

    // Receiver with literal comment "world"
    receive("world") {
        // handles messages with literal "world"
    }

    // Receiver for arbitrary text messages (non literal)
    receive(text: String) {
        // handles all text messages that don't exactly match literal receivers above
    }

    // Fallback binary receiver
    receive(msg: Slice) {
    }
}
