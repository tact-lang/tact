contract Test {
    counter: Int = 0;

    // Empty message receiver
    receive() {
        self.counter = self.counter + 1;
    }
}
