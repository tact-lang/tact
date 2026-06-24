contract OptionalDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;

    init() {
        self.a = null;
        self.c = true;
    }
}