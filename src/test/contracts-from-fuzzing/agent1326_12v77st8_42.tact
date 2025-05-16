contract OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: Cell?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}