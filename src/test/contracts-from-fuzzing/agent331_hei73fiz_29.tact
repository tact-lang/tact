contract PersDefaults {
    x: Int = 5;
    y: Bool = true;
    s: String = "abc";

    init() {
        self.x = 7;
        self.y = false;
        self.s = "def";
    }
}