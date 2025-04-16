contract WithDefaults {
    i: Int = 42;
    b: Bool = false;
    s: String = "qwe";

    init() {
        self.i = 100;
        self.b = true;
        self.s = "test";
    }
}