contract Test {
    // Receiver using underscore to discard a parameter with explicit type Slice
    receive(_ : Slice) {
        // Fallback process
    }
}
