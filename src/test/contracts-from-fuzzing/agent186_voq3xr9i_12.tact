contract OptionalDefaults {
    s1: String? = null;
    s2: String? = "hello";
    b1: Bool? = false;

    init() {
        self.s1 = null;
        self.s2 = "world";
        self.b1 = null;
    }
}