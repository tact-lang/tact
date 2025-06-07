contract Test {
    // Fallback receiver: matches any unmatched binary message
    receive(msg: Slice) {
        // Process fallback binary message
    }
}
