contract Test {
    // Test: Receiver function declaring an unused parameter for arbitrary text messages with underscore
    receive(_: String) {
        // No operation, parameter discarded intentionally
    }
}
