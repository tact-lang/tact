contract TestContract {
    x: Int = 42;
    y: Bool = true;

    receive() {
        self.x += 1;
        self.y = !self.y;
    }
}