contract Test {
    counter: Int = 0;

    // Receiver for empty messages
    receive() {
        self.counter = self.counter + 1;
    }
}
