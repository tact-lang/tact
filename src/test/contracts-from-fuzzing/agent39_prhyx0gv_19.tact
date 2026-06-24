message BounceMessage {
    v: Int;
}

contract Test {
    // Note: Declaration order is different from documented matching order and should not affect runtime matching

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // fallback logic
    }

    // Specific text receiver (for messages with comment "test")
    receive("test") {
        // handles message with comment "test"
    }

    // Receiver for empty messages
    receive() {
        // handles empty messages
    }

    // Generic text receiver for arbitrary text messages
    receive(str: String) {
        // handles all other text messages
    }

    // External message receiver
    external("external_message") {
        // handles external off-chain messages
    }

    // Bounced message receiver for bounced messages of type BounceMessage
    bounced(msg: bounced<BounceMessage>) {
        // handles bounced messages
    }
}
