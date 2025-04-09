contract Test2 {
    counter: Int = 0;

    // Specific text comment receiver, only called when message is exactly "hello"
    receive("hello") {
        self.counter = self.counter + 1;
    }

    // Fallback receiver to catch all messages
    receive(msg: Slice) {
        // no operation
    }
}
