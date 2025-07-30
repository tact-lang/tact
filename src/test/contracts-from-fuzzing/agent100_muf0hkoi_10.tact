message MyMessage {
    value: Int;
}

contract TestReceiverOrder {
    // Typed binary message receiver
    receive(msg: MyMessage) {
        // Handle typed binary message
    }

    // Specific text message receiver
    receive("hello") {
        // Handle specific text comment "hello"
    }

    // Empty message receiver
    receive() {
        // Handle empty message
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Handle unmatched binary message
    }
}
