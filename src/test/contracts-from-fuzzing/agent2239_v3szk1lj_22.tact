contract NoDefaults {
    x: Int;
    y: Bool;
    s: String;
    init() {
        self.x = 1;
        self.y = false;
        self.s = "hi";
    }
}