contract TestContract {
    x: Int = 1;
    y: Bool = true;

    init() {
        self.x = 42;
        self.y = false;
    }

    receive() {
        dump(self.x);
        dump(self.y);
    }
}
