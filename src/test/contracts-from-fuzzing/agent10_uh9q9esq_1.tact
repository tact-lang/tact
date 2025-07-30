contract TestGetter {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Getter function that modifies state (increments counter)
    get fun getCounter(): Int {
        self.counter = self.counter + 1;
        return self.counter;
    }
}
