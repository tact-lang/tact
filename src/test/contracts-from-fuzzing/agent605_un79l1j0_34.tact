contract LiteralDefaults {
    x: Int = 5;
    y: Bool = true;
    s: String = "abc";

    init() {
        self.x = 1;
        self.y = false;
        self.s = "xyz";
    }
}