contract WithDefaults {
    x: Int = 5;
    y: Bool = true;
    s: String = "foo";
    init() {
        self.x = 7;
        self.y = false;
        self.s = "bar";
    }
}