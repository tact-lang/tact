contract OnlyDefaults {
    a: Int = 10;
    b: Bool = true;
    s: String = "abc";

    init() {
        self.a = 1;
        self.b = false;
        self.s = "xyz";
    }
}