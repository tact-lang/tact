contract Test {
    // Fallback receiver using an underscore to discard the parameter
    receive(_msg: Slice) {
        // Handle fallback binary messages
    }
}
