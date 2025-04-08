contract SetNullReset {
    x: Int?;
    init() {
        self.x = 50;
        self.x = null;
    }
}
