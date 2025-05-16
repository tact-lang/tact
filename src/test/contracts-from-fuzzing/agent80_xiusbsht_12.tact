contract Test {
    // Test using underscore to discard the parameter for a fallback binary receiver
    receive(_: Slice) {
        // Correctly discarding the Slice parameter
    }
}
