message MyMessage {
    value: Int;
}

contract Test {
    // Fallback receiver listed first
    receive(msg: Slice) {
        // This is the fallback for binary messages
    }

    // Empty message receiver listed second
    receive() {
        // This should be chosen for empty messages
    }

    // Specific text receiver
    receive("hello") {
        // This handles messages labeled "hello"
    }

    // Catch-all text message receiver
    receive(str: String) {
        // This handles any other text message
    }

    // Typed binary message receiver
    receive(msg: MyMessage) {
        // This handles typed binary messages
    }
}
