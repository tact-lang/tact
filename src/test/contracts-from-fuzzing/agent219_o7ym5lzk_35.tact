contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.a = 3;
        self.b = false;
        self.s = "end";
    }
}