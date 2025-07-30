message MyMsg {
    x: Int;
}

contract TestReordered {
    // Fallback receiver (binary messages of unmatched types)
    receive(msg: Slice) {
        // Fallback
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Arbitrary text message
    }

    // Receiver for empty messages
    receive() {
        // Empty message
    }

    // Receiver for specific text comment messages (exact match "alpha")
    receive("alpha") {
        // Specific text message
    }

    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        // Typed binary message
    }
}
