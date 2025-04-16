contract Test {
    // Test 4: Fallback binary message receiver using Slice
    receive(msg: Slice) {}

    // The fallback receiver should handle all unmatched binary messages.
}
