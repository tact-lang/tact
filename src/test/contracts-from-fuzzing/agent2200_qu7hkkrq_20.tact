contract OverrideInit {
    counter: Int = 0;

    init() {
        self.counter = 42;
    }
}