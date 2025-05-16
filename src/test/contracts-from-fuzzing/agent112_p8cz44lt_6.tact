contract Test {
    // Fallback receiver: should catch all binary messages that don't match other receivers
    receive(msg: Slice) {
        let a = 1;
    }
}
