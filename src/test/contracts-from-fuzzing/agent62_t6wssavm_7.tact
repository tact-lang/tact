contract TestContract {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Valid fallback, body intentionally empty
    }
}
