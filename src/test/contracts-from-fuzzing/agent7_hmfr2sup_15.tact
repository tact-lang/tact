message MyMessage {
    a: Int;
}

// Test 15: Contract with no fallback receiver - valid, but will fail at runtime for unmatched binary messages
contract Test {
    // Empty message receiver
    receive() {}

    // Specific text message receiver
    receive("hello") {}

    // Arbitrary text message receiver
    receive(msg: String) {}

    // Typed binary message receiver
    receive(msg: MyMessage) {}

    fun dummy() {}
}
