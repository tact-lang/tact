contract Test {
    counter: Int = 0;

    // Basic empty message receiver
    receive() {
        self.counter = self.counter + 1;
    }
}
