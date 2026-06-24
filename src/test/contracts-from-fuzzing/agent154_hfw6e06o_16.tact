contract BoolDefaults {
    a: Bool = true;
    b: Bool = false;

    init() {
        self.a = false;
        self.b = true;
    }
}