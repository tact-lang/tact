contract OnlyDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "string";

    init() {
        self.a = 20;
        self.b = false;
        self.c = "new";
    }
}