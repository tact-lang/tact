contract TestReceiverOrderSwap {
    matched: Int = 0;
    
    // Fallback receiver for binary messages declared first (order should not affect matching)
    receive(msg: Slice) {
        self.matched = 4;
    }

    // Empty message receiver declared second
    receive() {
        self.matched = 3;
    }
}
