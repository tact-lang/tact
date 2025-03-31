contract Test {
    // Test case 2: Specific text comment receiver
    receive("greeting") {
        // Only handle messages with the exact text "greeting"
    }
}