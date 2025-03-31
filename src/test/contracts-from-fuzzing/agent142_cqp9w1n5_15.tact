contract Test {
    // Receiver using underscore to discard the parameter for an arbitrary text message
    receive(_: String) {
        // intentionally left empty
    }
}
