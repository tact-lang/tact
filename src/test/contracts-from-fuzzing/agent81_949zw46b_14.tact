contract Test {
    // Test 14: Contract with only an arbitrary text receiver, omitting fallback binary receiver
    // When a binary message (Slice) is received, no matching receiver exists and runtime should exit with code 130.
    receive(str: String) {
        // handling text message
    }
}
