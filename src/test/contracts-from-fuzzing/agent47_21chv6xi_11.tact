contract PrimitiveFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStringField: String?;

    init() {
        self.intField = 5;
        self.boolField = false;
        self.stringField = "abc";
        self.optIntField = null;
        self.optBoolField = null;
        self.optStringField = null;
    }
}