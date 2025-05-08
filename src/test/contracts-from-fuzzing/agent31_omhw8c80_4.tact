contract Test {
    counter: Int = 0;

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.counter = self.counter + 1;
    }
}
