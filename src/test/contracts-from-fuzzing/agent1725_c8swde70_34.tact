contract OnlyDefaults {
    a: Int = 4;
    b: Bool = true;
    s: String = "def";

    init() {
        self.a = 5;
        self.b = false;
        self.s = "zzz";
    }
}