contract OptionalDefaults {
    a: Int?;
    b: Int? = 5;
    c: Bool?;
    d: Bool? = false;

    init() {
        self.a = null;
        self.c = null;
    }
}