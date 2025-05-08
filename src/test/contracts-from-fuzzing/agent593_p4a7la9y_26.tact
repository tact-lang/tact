contract OptionalBoolIntDefaults {
    a: Bool? = null;
    b: Int? = null;

    init() {
        self.a = true;
        self.b = 123;
    }
}