contract NullReset {
    x: Int? = 12;
    y: Bool? = true;

    init() {
        self.x = null;
        self.y = null;
    }
}