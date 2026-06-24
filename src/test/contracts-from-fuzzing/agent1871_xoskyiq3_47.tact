contract OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "";

    init() {
        self.a = 5;
        self.b = true;
        self.s = "abc";
    }
}