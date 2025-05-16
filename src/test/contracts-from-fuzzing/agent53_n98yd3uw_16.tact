contract Test {
    state: Int;

    init() {
        self.state = 0;
    }

    // Out-of-order receiver declarations: arbitrary text receiver first
    receive(str: String) {
        self.state = 1;
    }

    // Empty message receiver declared second
    receive() {
        self.state = 2;
    }
}
