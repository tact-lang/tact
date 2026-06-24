contract OptionalBoolDefaults {
    b1: Bool? = null;
    b2: Bool? = null;

    init() {
        self.b1 = true;
        self.b2 = false;
    }
}