contract OptionalIntDefaults {
    a: Int?;
    b: Int?;

    init() {
        self.a = -1;
        self.b = null;
    }
}