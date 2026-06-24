contract TestDiscardUnderscore {
    // Receiver using underscore to discard parameter
    receive(_: String) {
        // No operation
    }
}
