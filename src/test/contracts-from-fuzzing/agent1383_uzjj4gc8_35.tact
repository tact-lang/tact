contract BoolDefaults {
    f1: Bool = true;
    f2: Bool = false;
    init() {
        self.f1 = false;
        self.f2 = true;
    }
}