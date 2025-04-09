contract OnlyDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";

    init() {
        self.a = 5;
        self.b = true;
        self.c = "hi";
    }
}
