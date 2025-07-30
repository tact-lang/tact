contract InitOverrideDefaults {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";

    init() {
        self.x = 42;
        self.y = false;
        self.s = "def";
    }
}