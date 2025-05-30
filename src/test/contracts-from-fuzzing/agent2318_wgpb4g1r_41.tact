contract OptionalDefaults {
    a: Int? = null;
    b: Int? = null;
    c: String? = null;
    d: Bool? = null;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = "set";
        self.d = true;
    }
}
