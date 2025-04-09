contract OptionalFieldsAndDefaults {
    a: Int = 1;
    b: Int?;
    c: Int = 3;
    d: Int?;

    init() {
        self.b = null;
        self.d = 4;
    }
}