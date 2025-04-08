contract ManyTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStringField: String?;

    init() {
        self.intField = 42;
        self.boolField = true;
        self.stringField = "hello";
        self.optIntField = null;
        self.optBoolField = null;
        self.optStringField = null;
    }
}