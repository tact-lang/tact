contract OptDefaults {
    a: Int?;
    b: Int = 4;

    init() {
        self.a = null;
        self.b = 5;
    }
}