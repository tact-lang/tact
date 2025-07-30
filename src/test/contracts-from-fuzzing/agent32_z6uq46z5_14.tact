contract MixedFlatState {
    intField: Int;
    boolField: Bool;
    optIntField: Int?;
    optBoolField: Bool?;
    stringField: String;
    optStringField: String?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.optIntField = null;
        self.optBoolField = null;
        self.stringField = "hi";
        self.optStringField = null;
    }
}
