contract Test {
    // Receiver with an arbitrary text parameter. Should match any text message that isn't caught by a specific comment receiver.
    receive(str: String) {}
}
