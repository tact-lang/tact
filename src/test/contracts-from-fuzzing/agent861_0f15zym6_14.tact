contract NoDefaults {
    x: Int;
    y: Bool;

    init() {
        self.x = 10;
        self.y = true;
    }

    receive() {
        let _ = self.x;
        let _ = self.y;
    }
}