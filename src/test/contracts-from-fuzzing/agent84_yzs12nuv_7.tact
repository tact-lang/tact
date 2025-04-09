message MyMessage {
    value: Int;
}

contract Test {
    // 1. Empty message receiver
    receive() {
        // Empty message receiver
    }

    // 2. Specific text receiver: matches only when message is exactly "hello"
    receive("hello") {
        // Handles messages with comment "hello"
    }

    // 3. Arbitrary text receiver: handles any text message
    receive(str: String) {
        // Arbitrary text receiver
    }

    // 4. Typed binary message receiver: expects a message of type MyMessage
    receive(msg: MyMessage) {
        // Typed binary message receiver
    }

    // 5. Fallback binary message receiver: catches all unmatched binary messages
    receive(msg: Slice) {
        // Fallback binary receiver
    }
}
