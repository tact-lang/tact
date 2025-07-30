contract SingleIntField {
    counter: Int;

    init() {
        self.counter = 0;
    }

    receive() {
        self.counter += 1;
    }
}