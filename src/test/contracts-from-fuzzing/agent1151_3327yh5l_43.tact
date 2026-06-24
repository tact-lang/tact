contract BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool; // uninitialized bool
    init() {
        self.c = true;
    }
}