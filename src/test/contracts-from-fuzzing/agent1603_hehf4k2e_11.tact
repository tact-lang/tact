contract OptionalFieldsDirect {
    optionalIntField: Int?;
    optionalBoolField: Bool?;
    optionalStringField: String?;

    init() {
        self.optionalIntField = null;
        self.optionalBoolField = true;
        self.optionalStringField = null;
    }
}