contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = 100;
        self.b = true;
    }
}