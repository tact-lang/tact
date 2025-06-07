contract BoolDefaults {
    p: Bool = false;
    q: Bool = true;

    init() {
        self.p = true;
        self.q = false;
    }
}