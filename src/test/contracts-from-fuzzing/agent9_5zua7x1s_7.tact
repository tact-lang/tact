contract GetterTestBad2 {
    counter: Int;

    init() {
        self.counter = 42;
    }

    // Another variant of an incorrect getter that tries to modify the state
    get fun badGetter2(): Int {
        self.counter = self.counter + 1; // modification of state in getter
        return self.counter;
    }
}
