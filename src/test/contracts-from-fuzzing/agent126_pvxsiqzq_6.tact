contract Test {
    // Test: Fallback receiver function that catches unmatched binary messages using Slice
    receive(msg: Slice) {}
}
