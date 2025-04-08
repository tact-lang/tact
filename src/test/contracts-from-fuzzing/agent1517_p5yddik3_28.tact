contract Test {
    small: Int as uint4;

    init() {
        self.small = 999;
        self.small = 7;
    }

    receive() {}
}