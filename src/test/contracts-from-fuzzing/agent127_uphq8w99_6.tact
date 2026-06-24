contract Test5 {
    // Fallback receiver: catches all binary messages that did not match earlier receivers
    receive(msg: Slice) {
        // Do nothing
    }
}
