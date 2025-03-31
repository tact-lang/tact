contract Test {
    // Fallback binary message receiver: accepts all unmatched binary messages
    receive(msg: Slice) {}
}
