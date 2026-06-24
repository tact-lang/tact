contract Test {
    state1: Int = 1;
    state2: Int = 2;

    init() {
        self.state1 = 10;
        self.state2 = 20;
    }

    get fun get_data(): Test {
        return self;
    }
}