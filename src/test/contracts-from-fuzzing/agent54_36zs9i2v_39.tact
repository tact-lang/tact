contract OptionalMixedDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Int?;
    d: Bool?;

    init() {
        self.c = null;
        self.d = true;
    }
}