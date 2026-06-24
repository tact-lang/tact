contract OnlyDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "q";
    init() {
        self.a = 42;
        self.b = false;
        self.c = "r";
    }
}