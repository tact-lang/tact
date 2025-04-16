contract Test {
    // Test case 4: Fallback binary message receiver using Slice parameter
    receive(msg: Slice) {
        // For any unmatched binary message, do nothing
    }
}