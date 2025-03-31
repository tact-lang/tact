message MyMessage {
    value: Int;
}

contract Test {
    // Test 14: All receiver types in one contract to verify matching priority (ordering is implicit)
    receive() {
        // Default receiver for empty message
    }

    receive("specific") {
        // Receiver for specific text commented message
    }

    receive(str: String) {
        // Receiver for arbitrary text messages
    }

    receive(msg: MyMessage) {
        // Receiver for typed binary messages
    }

    receive(msg: Slice) {
        // Fallback receiver for unmatched binary messages
    }
}
