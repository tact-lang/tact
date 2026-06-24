contract OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = 999;
        self.b = true;
        self.c = "word";
    }
}