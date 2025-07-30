contract Test {
    // Fallback receiver: This receiver catches all unmatched binary messages
    receive(msg: Slice) {}
}
