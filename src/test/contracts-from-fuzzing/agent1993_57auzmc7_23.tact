contract AllDefaultValues {
    x: Int = 0;
    y: Bool = false;
    s: String = "";

    init() {
        self.x = 42;
        self.y = true;
        self.s = "test";
    }
}