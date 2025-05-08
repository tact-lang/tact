contract OnlyDefaults {
    a: Int = 0;
    b: String = "b";
    c: Bool = true;

    init() {
        self.a = 42;
        self.b = "changed";
        self.c = false;
    }
}
