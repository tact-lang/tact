contract ComplexDefaults {
    a: Int = 5;
    b: Int?;
    c: Bool?;

    init() {
        self.b = null;
        self.c = null;
    }
}
