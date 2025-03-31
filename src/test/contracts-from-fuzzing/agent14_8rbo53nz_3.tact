contract AugAssign {
    x: Int;

    init() {
        self.x = 5;
    }

    receive() {
        self.x += 10;
        dump(self.x);
    }
}
