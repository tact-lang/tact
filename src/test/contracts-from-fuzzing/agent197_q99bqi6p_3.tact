contract Test {
    // specific text receiver: matches exactly "exact"
    receive("exact") {
        // action for exact match
    }

    // generic string receiver: matches any string message
    receive(message: String) {
        // action for generic string message
    }

    // fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // fallback action
    }
}
