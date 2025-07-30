contract TestFallback {
    // Testing fallback receiver: 'receive(msg: Slice)'
    receive(msg: Slice) {
        // This fallback receiver should process any binary message that does not match previous patterns
    }
}
