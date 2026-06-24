message MyMessage {
    a: Int;
}

contract TestReceiverMsg {
    // Receiver for typed binary messages, matching when message is of type MyMessage
    receive(msg: MyMessage) {
        // Process message of type MyMessage
    }

    // Fallback to catch all unmatched binary messages
    receive(msg: Slice) {
        // Fallback processing
    }

    // Receiver for text message with specific text
    receive("hello") {
        // Process message with comment "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Process any arbitrary text message
    }

    // Receiver for empty messages
    receive() {
        // Process empty message
    }
}
