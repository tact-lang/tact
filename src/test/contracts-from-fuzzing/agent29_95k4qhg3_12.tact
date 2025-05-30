contract Test {
    // Test 12: Fallback receiver for binary messages using Slice
    receive(msg: Slice) {
        // Using the slice parameter to avoid unused warning
        let _dummy = msg;
    }
}
