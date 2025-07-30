contract Test1 {
    // Test for specific text receiver: should match when message equals "hello"
    receive("hello") {
        // minimal implementation
    }

    // Dummy getter to ensure contract usage
    get fun dummy(): Int {
        return 1;
    }
}
