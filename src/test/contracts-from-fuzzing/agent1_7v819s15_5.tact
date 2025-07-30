contract Test5 {
    // Test 5: Fallback binary message receiver using Slice
    // This fallback receiver should catch all binary messages that did not match earlier receivers
    receive(msg: Slice) {
        // No action, just to confirm compilation and fallback behavior
    }
}
