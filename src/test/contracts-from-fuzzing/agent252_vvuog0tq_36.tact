contract Test {
    x: Int;

    init() {
        self.x = 10;
    }

    receive() {
        self.x = self.x + 1;
    }
}