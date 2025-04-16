contract OptionalBoolDefaults {
    a: Bool? = null;
    b: Bool = false;
    c: Bool? = null;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
    }
}