contract InitNoDefaults {
    x: Int;
    y: Bool;

    init() {
        self.x = 42;
        self.y = true;
    }
}