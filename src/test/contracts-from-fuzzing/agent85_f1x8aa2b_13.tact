contract FieldsWithOptionalAndDefaults {
    a: Int = 10;
    b: Int?;

    init() {
        self.b = 42;
    }

    receive() {}
}