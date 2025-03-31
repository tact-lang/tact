message MyMessage {
    a: Int;
}

contract Test {
    // Test 14: Receiver functions declared in non-documented order (order should not affect execution)
    // Even though they are declared in a different order, matching is done in the documented priority:
    // 1. receive() for empty messages
    // 2. receive("text") for specific text messages
    // 3. receive(msg: String) for arbitrary text messages
    // 4. receive(msg: MyMessage) for typed binary messages
    // 5. receive(msg: Slice) as fallback for unmatched binary messages

    receive(msg: Slice) {
        // Fallback receiver (should be matched last)
    }

    receive(msg: String) {
        // Arbitrary text message receiver
    }

    receive("hello") {
        // Specific text message receiver (should be matched for "hello")
    }

    receive() {
        // Empty message receiver
    }

    receive(msg: MyMessage) {
        // Typed binary message receiver
    }

    fun dummy() {}
}
