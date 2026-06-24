contract FallbackBinaryReceiver {
    // This receiver should handle all unmatched binary messages using Slice parameter
    receive(msg: Slice) {}
}
