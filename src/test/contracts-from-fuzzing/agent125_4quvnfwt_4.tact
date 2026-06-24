contract Test {
    // Test usage of underscore for discarding binary message parameter
    receive(_: Slice) {
        // Fallback receiver for binary messages
    }
}
