contract TestContract {
    counter: Int = 0;
    active: Bool = false;

    init() {
        self.counter = 123;
        self.active = true;
    }

    receive() {
        self.counter += 1;
    }
}