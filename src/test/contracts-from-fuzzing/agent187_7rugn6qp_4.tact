contract Test {
    counter: Int = 0;

    // Arbitrary text message receiver using a named parameter
    receive(str: String) {
        self.counter = 5;
    }
}
