contract OptionalBoolPersistence {
    f: Bool?;

    init() {
        self.f = null;
        self.f = true;
        self.f = null;
        self.f = false;
    }
}