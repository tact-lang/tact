contract Test {
    initial: Int;

    init() {
        self.initial = 10;
    }

    receive() {
        self.initial = 100;
    }
}