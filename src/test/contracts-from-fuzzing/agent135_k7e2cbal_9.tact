contract MultiReceiver {
    // empty message receiver
    receive() {}

    // receiver for specific text "hello"
    receive("hello") {}

    // receiver for arbitrary text messages
    receive(str: String) {}

    // fallback receiver for binary messages
    receive(msg: Slice) {}
}
