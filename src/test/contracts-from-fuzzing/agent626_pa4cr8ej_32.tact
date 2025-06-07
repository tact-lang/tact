contract OnlyDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;

    init() {
        self.a = 2;
        self.b = "y";
        self.c = false;
    }
}