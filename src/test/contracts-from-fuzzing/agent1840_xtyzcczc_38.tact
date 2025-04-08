contract OnlyDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";

    init() {
        self.a = 1;
        self.b = true;
        self.s = "abc";
    }
}