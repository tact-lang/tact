contract OptionalBoolDefaults {
    a: Bool?;
    b: Bool? = false;
    c: Bool? = true;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
