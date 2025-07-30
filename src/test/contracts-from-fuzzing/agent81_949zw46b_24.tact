contract Test {
    // Test 24: Declaration order reversed between generic text receiver and specific text receiver
    receive(str: String) {
        // Generic text receiver
    }

    receive("specific") {
        // Specific text receiver
    }

    receive() {
        // Empty message receiver
    }
}
