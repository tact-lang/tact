message MyMessage {
    value: Int
}

contract TestMixReceiver {
    // 1. Empty message receiver
    receive() {}

    // 2. Specific text message receiver for "message"
    receive("message") {}

    // 3. Arbitrary text message receiver
    receive(str: String) {}

    // 4. Binary typed message receiver for MyMessage
    receive(msg: MyMessage) {}

    // 5. Fallback binary message receiver for all other binary messages
    receive(msg: Slice) {}
}
