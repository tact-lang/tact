contract Test {
    // Receiver that discards the String parameter using underscore
    receive(_: String) {
        // do nothing
    }
}
