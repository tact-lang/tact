contract BoolDefaults {
    f: Bool = false;
    t: Bool = true;

    init() {
        self.f = true;
        self.t = false;
    }
}