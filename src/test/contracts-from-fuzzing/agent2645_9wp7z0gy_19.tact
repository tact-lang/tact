contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;

    init() {
        self.a = 5;
        self.b = null;
        self.c = "foo";
    }
}
