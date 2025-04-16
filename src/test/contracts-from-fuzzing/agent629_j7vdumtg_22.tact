contract OptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;

    init() {
        self.a = 123;
        self.b = "foo";
        self.c = true;
    }
}