contract NullableFields {
    intField: Int?;
    boolField: Bool?;
    stringField: String?;

    init() {
        self.intField = null;
        self.boolField = null;
        self.stringField = null;
    }
}