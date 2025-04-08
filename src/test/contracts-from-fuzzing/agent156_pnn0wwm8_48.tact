contract OptBoolDefaults {
    a: Bool?;
    b: Bool? = null;
    c: Bool? = true;

    init() {
        self.a = false;
        self.b = true;
        self.c = null;
    }
}
