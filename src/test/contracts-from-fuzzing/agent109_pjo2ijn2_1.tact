contract Test {
    // Test 1: Simple empty message receiver
    receive() {
        // empty receiver for empty messages
    }

    // allow contract to compile by adding a dummy function reference
    get fun test(): Int {
        return 42;
    }
}
