contract Test {
    // Fallback receiver for binary messages with discarding receiver parameter using underscore
    receive(_: Slice) {
        // Handler for unmatched binary messages
    }
}
