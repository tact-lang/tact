message MyMessage {
    a: Int;
}

contract Test {
    // 1. Empty message receiver
    receive() {}

    // 2. Specific text comment receiver
    receive("message") {}

    // 3. Arbitrary text message receiver
    receive(str: String) {}

    // 4. Typed binary message receiver
    receive(msg: MyMessage) {}

    // 5. Fallback binary receiver: catches all unmatched binary messages
    receive(msg: Slice) {}
}
