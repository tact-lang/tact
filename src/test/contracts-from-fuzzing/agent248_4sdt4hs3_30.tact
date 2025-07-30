contract EdgeOptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "x";

    init() {
        self.a = 5;
        self.b = null;
        self.c = null;
    }
}