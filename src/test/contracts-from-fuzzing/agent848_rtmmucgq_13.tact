contract BoolDefaults {
    b1: Bool = false;
    b2: Bool = true;

    init() {
        self.b1 = true;
        self.b2 = false;
    }
}