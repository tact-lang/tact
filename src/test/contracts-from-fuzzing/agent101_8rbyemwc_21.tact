contract TestContract {
    x: Int;
    y: Bool;

    init() {
        self.x = 5;
        self.y = false;
    }

    receive() {
        self.x += 1;
    }
}