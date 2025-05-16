contract InitNoDefaults {
    x: Int;
    y: Bool;
    init() {
        self.x = 7;
        self.y = true;
    }
    receive() {
        let _ = self.y;
    }
}