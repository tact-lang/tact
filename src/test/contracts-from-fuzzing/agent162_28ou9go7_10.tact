message MyMessage {
    value: Int;
}

contract Test {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback message
    }

    // Specific text comment receiver
    receive("specific") {
        // Handle specific text message "specific"
    }

    // Typed binary message receiver
    receive(msg: MyMessage) {
        let x = msg.value;
    }

    // Arbitrary text message receiver
    receive(str: String) {
        // Handle arbitrary text message
    }

    // Empty message receiver
    receive() {
        // Handle empty message
    }
}
