contract Test {
    // Test 12: Discarding parameter using underscore in an arbitrary text message receiver
    // The parameter is discarded and not available to the body
    receive(_: String) {
        // Code body is empty. The received text message is intentionally ignored.
    }
}
