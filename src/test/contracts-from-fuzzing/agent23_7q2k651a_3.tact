contract Test {
    // Receiver for a specific text message
    receive("hello") {
        // Expected to match only messages with the exact text "hello"
    }

    get fun dummy(): Int {
        return 10;
    }
}
