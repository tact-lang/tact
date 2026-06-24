message MyMessage {
    value: Int;
}

contract TestReceiverPriority {
    // Receiver for empty messages
    receive() {
        // handle empty message
    }

    // Receiver for specific text message "hello"
    receive("hello") {
        // handle specific text message "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // handle arbitrary text message
    }

    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        // handle typed binary message
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // handle fallback binary message
    }
}

// This contract tests that message matching adheres to the documented priority order