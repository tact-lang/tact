contract Test {
    // Fallback binary receiver: catches all binary messages that do not match previous receivers
    receive(msg: Slice) {
        // Process the message slice, e.g., by reading its opcode
        let _ = msg;
    }
}
