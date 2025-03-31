contract Test5 {
    // Fallback receiver for binary messages: catches all unmatched binary messages
    receive(msg: Slice) {
        // Minimal dummy operation
        let dummy = 1;
    }
}
