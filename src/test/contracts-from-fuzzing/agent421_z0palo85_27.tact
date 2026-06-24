contract OptionalAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
    init() {
        self.a = 100;
        self.b = true;
        self.s = "wow";
    }
}