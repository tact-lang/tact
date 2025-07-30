contract Test {
    // Receiver using underscore to discard the Slice parameter.
    receive(_: Slice) {
        // Discarded Slice receiver
    }
}
