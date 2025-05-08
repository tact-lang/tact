contract TestUnderscore {
    // Test receiver function with discard parameter (using underscore) for arbitrary text messages
    receive(_: String) {
        // No operation
    }
}
