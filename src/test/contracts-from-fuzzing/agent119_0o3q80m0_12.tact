message MyMessage {
    value: Int;
}

contract Test {
    // Receiver with fallback for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handler
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle any text message not matched by specific text
    }

    // Receiver for messages with the specific text comment "specific"
    receive("specific") {
        // Handle messages with the comment "specific"
    }

    // Receiver for empty messages
    receive() {
        // Handle empty messages
    }

    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        // Handle typed binary messages
    }
}
