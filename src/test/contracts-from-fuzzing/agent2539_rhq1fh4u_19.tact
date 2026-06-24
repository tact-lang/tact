contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.a = 123;
        self.b = true;
        self.s = "abc";
    }
}