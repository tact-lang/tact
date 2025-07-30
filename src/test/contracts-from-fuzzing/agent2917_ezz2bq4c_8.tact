contract OnlyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "changed";
    }
}
