contract TestExternalUnderscore {
    // External receiver with underscore to discard the parameter
    external(_: String) {
        // Off-chain message handler that doesn't use the text
    }
}
