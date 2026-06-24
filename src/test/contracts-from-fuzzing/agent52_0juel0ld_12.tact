message TestMsg {
    value: Int;
}

contract Test {
    // Test contract with receivers declared in arbitrary order

    // Fallback receiver (lowest priority)
    receive(msg: Slice) {
        // Fallback for unmatched binary messages
    }

    // Specific text receiver
    receive("spec") {
        // Receiver for messages with exact comment "spec"
    }

    // Arbitrary text receiver
    receive(str: String) {
        // Receiver for arbitrary text messages
    }

    // Empty message receiver
    receive() {
        // Receiver for empty messages
    }

    // Typed binary message receiver
    receive(msg: TestMsg) {
        // Receiver for typed binary messages
    }
}
