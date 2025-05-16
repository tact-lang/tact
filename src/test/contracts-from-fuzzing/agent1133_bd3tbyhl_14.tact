contract DefaultAndInit {
    x: Int = 0;
    y: Bool;

    init() {
        self.y = false;
        self.x = 10;
    }
}