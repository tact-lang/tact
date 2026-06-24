contract EmptyDefaults {
    x: Int = 0;
    y: Bool = false;
    s: String = "";

    init() {
        self.x = 5;
        self.y = true;
        self.s = "abc";
    }
}
