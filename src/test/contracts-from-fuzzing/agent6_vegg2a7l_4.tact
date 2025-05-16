contract Test {
    // Fallback receiver: triggers for all unmatched binary messages
    // Using underscore to discard receiver parameter
    receive(_: Slice) {
        // fallback handler
    }
}
