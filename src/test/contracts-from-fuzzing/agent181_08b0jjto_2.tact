contract Test {
    // Specific text receiver
    receive("hello") {
        // do nothing
    }

    receive() {
        // Default empty receiver
    }
}
