contract GetterTestCorrect {
    counter: Int;

    init() {
        self.counter = 42;
    }

    // Correct getter: only returns the value without modifying state
    get fun getCounter(): Int {
        return self.counter;
    }
}
