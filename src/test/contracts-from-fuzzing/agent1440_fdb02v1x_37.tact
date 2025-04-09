contract OnlyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Int = 4;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "t";
        self.d = 40;
    }
}