contract TestUnderscore {
    // Test usage of underscore to discard receiver parameter (fallback receiver)
    receive(_: Slice) {
        // minimal fallback receiver using underscore
    }
}
