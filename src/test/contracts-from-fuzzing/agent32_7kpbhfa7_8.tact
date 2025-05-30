message MyMessage {
    a: Int;
}

contract Test {
    // Test 8: Discarding parameter using underscore in a typed binary message receiver
    // The parameter is discarded and not available to the body
    receive(_: MyMessage) {
        // Code body is empty. The received message is intentionally ignored.
    }
}
