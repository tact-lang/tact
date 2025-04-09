contract Test {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Using msg to ensure the function is compiled
        msg;
    }
}
