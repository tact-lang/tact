contract TestContract {
    x: Int = 1;
    y: Bool = false;

    init() {
        self.x = 100;
        self.y = true;
    }

    receive() {
        self.x += 1;
        self.y = !self.y;
    }
}