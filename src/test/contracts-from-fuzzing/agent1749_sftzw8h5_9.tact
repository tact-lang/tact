contract AssignBeforeInit {
    counter: Int;

    init() {
        self.counter = 10;
        self.counter = 100;
    }
}