contract Test {
    // Test for fallback receiver with unmatched binary messages using Slice as parameter
    receive(msg: Slice) {
        // This receiver should catch all binary messages that didn't match earlier receivers
    }
}
