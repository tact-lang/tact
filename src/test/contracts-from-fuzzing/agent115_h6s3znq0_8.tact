contract TestReceiverPriority {
    x: Int = 0;

    // 1. Empty message receiver
    receive() {
        self.x = 1;
    }

    // 2. Literal text receiver (matches exactly "hello")
    receive("hello") {
        self.x = 2;
    }

    // 3. String parameter receiver for arbitrary text messages
    receive(msg: String) {
        self.x = 3;
    }

    // 4. Binary message receiver fallback
    receive(msg: Slice) {
        self.x = 4;
    }
}
