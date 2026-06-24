contract Test {
    // Fallback receiver with underscore parameter to discard the incoming message
    receive(_ : Slice) {
        // action for unmatched binary message
    }
}
