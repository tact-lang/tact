contract TestFallback {
    receive(msg: Slice) {
        // This receiver is the fallback for unmatched binary messages.
    }
}
