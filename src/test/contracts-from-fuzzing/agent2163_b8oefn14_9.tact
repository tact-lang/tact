contract BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool; // uninitialized, must be set in init

    init() {
        self.c = true;
    }
}