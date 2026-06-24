message MyMessage {
    value: Int;
}

contract TestReceivers {
    // 1. Empty message receiver
    receive() { }

    // 2. Specific text comment receiver
    receive("hello") { }

    // 3. Arbitrary text message receiver
    receive(str: String) { }

    // 4. Typed binary message receiver
    receive(msg: MyMessage) { }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) { }
}
