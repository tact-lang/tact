contract Test {
    // Empty message receiver
    receive() {
        // no-op
    }

    // Additional dummy getter to ensure contract finalization
    get fun dummy(): Int {
        return 42;
    }
}