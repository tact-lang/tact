contract InitDefaults {
    a: Int = 10;
    b: Bool = false;

    init() {
        self.a = 100;
        self.b = true;
    }
}