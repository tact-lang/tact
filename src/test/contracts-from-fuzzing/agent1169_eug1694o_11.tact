contract OptionalFieldDefaults {
    field1: Int?;
    field2: String?;

    init() {
        self.field1 = null;
        self.field2 = null;
    }
}