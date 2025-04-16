contract Test {
    // Fallback receiver: catches all binary messages that do not match previous receivers
    receive(msg: Slice) {
        // Implementation: for testing purposes, do nothing
    }
}
