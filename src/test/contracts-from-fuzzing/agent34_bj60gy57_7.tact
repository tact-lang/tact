contract Test {
    fallbackTriggered: Bool = false;

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        self.fallbackTriggered = true;
    }
}
