contract TestDiscardParameterSlice {
    // Fallback receiver function for binary messages using underscore to discard the parameter
    receive(_ : Slice) {
        // No operation; parameter is discarded
    }
}
