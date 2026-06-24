contract Test {
    // Underscore parameter receiver for discarding text messages
    receive(_: String) {
        // Discard the incoming text, no operations performed
    }
}
