contract TestTextLiteral {
    // Test for a receiver that matches a specific text comment
    receive("hello") {
        // Comment-specific receiver
    }
}
