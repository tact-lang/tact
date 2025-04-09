contract Test4 {
    // Test for fallback receiver with raw Slice parameter
    receive(msg: Slice) {
        // empty implementation to trigger fallback receiver
    }
}
