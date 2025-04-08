contract OptionalBoolDefaults {
    f1: Bool? = null;
    f2: Bool? = null;
    init() {
        self.f1 = true;
        self.f2 = null;
    }
}