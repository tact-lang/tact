contract Test {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // This receiver should be called for any binary messages that don't match other patterns
        let dummy = 0; // dummy operation
    }
}
