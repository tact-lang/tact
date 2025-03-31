message MyMessage { a: Int; }

contract Test {
    // Receiver for empty message
    receive() {
        // Handle empty message
    }

    // Receiver for specific text comment "hello"
    receive("hello") {
        // Handle specific text message
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle arbitrary text message
    }

    // Receiver for typed binary message with custom type MyMessage
    receive(msg: MyMessage) {
        // Handle typed binary message
    }

    // Fallback receiver for any unmatched binary message
    receive(msg: Slice) {
        // Handle unmatched binary message
    }
}
