contract OptionalFieldsContract {
    field1: Int?;
    field2: Bool?;

    init() {
        self.field1 = null;
        self.field2 = true;
    }
}