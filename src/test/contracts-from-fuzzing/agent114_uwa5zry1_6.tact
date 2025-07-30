contract Test {
    // Fallback receiver: catches all binary messages not matching other typed receivers
    receive(msg: Slice) {
    }
}
