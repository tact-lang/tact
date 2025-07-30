contract OptionalBoolDefaults {
    a: Bool? = null;
    b: Bool? = false;
    init() {
        self.a = null;
        self.b = true;
    }
}