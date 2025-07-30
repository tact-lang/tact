contract InitOverride {
    x: Int = 1;
    s: String = "def";
    b: Bool;

    init() {
        self.x = 12;
        self.s = "xyz";
        self.b = true;
    }
}