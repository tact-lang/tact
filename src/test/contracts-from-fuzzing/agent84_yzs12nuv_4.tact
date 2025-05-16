contract Test {
    // Fallback receiver for binary messages using Slice; using '_' to discard parameter
    receive(_ : Slice) {
        // Fallback implementation
    }
}
