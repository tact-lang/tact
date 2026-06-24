contract GetterTestBad {
    counter: Int;

    init() {
        self.counter = 42;
    }

    // Incorrect getter: attempts to modify state, which is forbidden according to documentation
    get fun badGetter(): Int {
        self.counter += 1; // this should trigger a type check error or similar
        return self.counter;
    }
}
