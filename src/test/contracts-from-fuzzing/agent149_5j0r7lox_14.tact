contract Test {
    receive(_: Slice) {
        // Fallback receiver for binary messages using underscore to discard parameter
    }
}
