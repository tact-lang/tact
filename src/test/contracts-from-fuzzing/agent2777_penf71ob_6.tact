contract TestContract {
    intField: Int = 0;
    boolField: Bool = false;
    stringField: String = "";
    optIntField: Int?;
    optBoolField: Bool?;
    optStringField: String?;

    init() {
        self.optIntField = null;
        self.optBoolField = null;
        self.optStringField = null;
    }
}