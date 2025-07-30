contract TestAssignment {
    counter: Int;

    init() {
        self.counter = 10;
    }

    receive() {
        self.counter = self.counter + 5;
        self.counter += 3;
        dump(self.counter);
    }
}
