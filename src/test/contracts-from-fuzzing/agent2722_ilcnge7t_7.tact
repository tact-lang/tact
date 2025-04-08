contract OnlyOptionals {
    x: Int?;
    y: Bool?;
    s: String?;

    init() {
        self.x = null;
        self.y = true;
        self.s = null;
    }
}