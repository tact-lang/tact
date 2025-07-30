message MyMsg {
    value: Int;
}

contract TestOrder {
    // Test: Receiver matching order for overlapping message types.
    // If a message has comment "hello", it should match the specific text receiver.
    receive("hello") {
        // Specific text receiver
    }

    // Arbitrary text message receiver for any other text message
    receive(str: String) {
        // Handles generic text messages
    }

    // Receiver for a typed binary message
    receive(msg: MyMsg) {
        // Handles MyMsg binary message
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Fallback for binary messages
    }
}
