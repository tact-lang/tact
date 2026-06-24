contract ManyPrimitiveFields {
    intField: Int;
    boolField: Bool;
    strField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStrField: String?;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.strField = "hello";
        self.optIntField = null;
        self.optBoolField = null;
        self.optStrField = "world";
    }
}