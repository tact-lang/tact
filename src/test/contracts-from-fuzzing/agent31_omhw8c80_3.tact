contract Test {
    counter: Int = 0;

    // Receiver for specific text message "hello"
    receive("hello") {
        self.counter = self.counter + 1;
    }
}
