contract TestReceiverPriority {
    // Testing receiver function matching priority without affecting other types
    // When a message with comment "match" is sent, it should be handled by the specific text comment receiver
    // instead of the arbitrary text receiver
    
    receive("match") {
        // Specific text receiver for "match"
    }

    receive(str: String) {
        // Arbitrary text receiver for any text.
    }
}
