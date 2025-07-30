contract BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;

    init() {
        self.b1 = false;
        self.b2 = true;
    }
}