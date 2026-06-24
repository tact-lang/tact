contract BoolDefaults {
    f1: Bool;
    f2: Bool = true;
    f3: Bool?;

    init() {
        self.f1 = false;
        self.f3 = null;
    }
}