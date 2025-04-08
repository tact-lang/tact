contract OptionalAndDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool? = null;

    init() {
        self.b = null;
    }
}
