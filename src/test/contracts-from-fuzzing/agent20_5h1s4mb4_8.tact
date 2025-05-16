contract TestFallback {
    // fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        let a: Int = 42;
    }
}
