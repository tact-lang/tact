contract Test {
    // Test case 2: Specific text comment receiver
    receive("hello") {
        // No operation
    }

    // A dummy function call that ensures the receiver function is compiled even though it's message based.
    // In actual usage, a message with text "hello" would trigger this function.
}
