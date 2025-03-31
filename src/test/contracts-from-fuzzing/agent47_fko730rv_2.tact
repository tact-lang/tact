contract TestGetter {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Getter function which attempts to modify a state variable
    get fun getAndChange(): Int {
        self.counter = self.counter + 1;
        return self.counter;
    }
}
