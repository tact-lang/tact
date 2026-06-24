contract DefaultPersistents {
    x: Int = 1;
    y: Bool = false;
    s: String = "default";
    init() {
        self.x = 5;
        self.y = true;
        self.s = "changed";
    }
}