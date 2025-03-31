contract Test4 {
    // This contract tests the fallback receiver for binary messages using Slice
    receive(msg: Slice) {
        // Fallback mechanism: should capture all unmatched binary messages
    }
}
