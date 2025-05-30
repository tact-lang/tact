contract Test {
    // Testing fallback reception with underscore parameter
    receive(_: Slice) {
        // Fallback receiver that discards the slice message
    }
}
