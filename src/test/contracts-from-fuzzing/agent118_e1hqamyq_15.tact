message MyMsg {
    value: Int;
}

contract TestReceiverOrder {
    // Test: All receiver forms declared in one contract to test matching order

    // 1. Empty message receiver
    receive() {
        // Should match empty messages
    }

    // 2. Specific text receiver
    receive("hello") {
        // Should match text message with 'hello'
    }

    // 3. Arbitrary text receiver
    receive(str: String) {
        // Should match unmatched text messages
    }

    // 4. Typed binary message receiver
    receive(msg: MyMsg) {
        // Should match binary messages of type MyMsg
    }

    // 5. Fallback receiver for binary messages
    receive(msg: Slice) {
        // Fallback for unmatched binary messages
    }
}
