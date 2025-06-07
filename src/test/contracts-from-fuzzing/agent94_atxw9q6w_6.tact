contract Test {
    // Test 6: Fallback receiver using Slice parameter
    receive(msg: Slice) {
        // This receiver should act as fallback for all unmatched binary messages
    }
}
