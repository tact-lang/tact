contract InitDefaults {
    a: Int = 42;
    b: Bool = true;

    init() {
        self.a = 100;
        self.b = false;
    }
}