contract OnlyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";

    init() {
        self.a = 7;
        self.b = false;
        self.c = "done";
    }
}